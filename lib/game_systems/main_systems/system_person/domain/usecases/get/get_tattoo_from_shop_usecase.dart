import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_quality.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_size.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/tattoo_repository.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/get/get_person_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_money/check_if_player_can_afford_it_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_money/take_money_from_player_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/tattoo_utils/tattoo_utils.dart';

class GetTattooFromShopUsecase {
  final TattooRepository _tattooRepository;
  final CheckIfPlayerCanAffordItUsecase _checkIfPlayerCanAffordItUsecase;
  final TakeMoneyFromPlayerUsecase _takeMoneyFromPlayerUsecase;
  final GetPersonUsecase _getPersonUsecase;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  const GetTattooFromShopUsecase(
    this._tattooRepository,
    this._checkIfPlayerCanAffordItUsecase,
    this._takeMoneyFromPlayerUsecase,
    this._getPersonUsecase,
    this._journalUsecases,
    this._dialogHandler,
  );

  Future<void> execute({
    required int personID,
    required int gameID,
    required int currentDay,
    required TattooBodyLocation tattooBodyLocation,
    required TattooShop tattooShop,
    required TattooSize tattooSize,
    required String tattooDescription,
  }) async {
    //get person
    final Person? person = await _getPersonUsecase.execute(personID: personID);

    //if person is valid
    if (person != null) {
      //entries
      late final String resultTitle;
      late final String resultDescription;
      late final String journalEntry;

      //get economy adjusted price
      final int economyAdjustedCost = getCountryEconomyAdjustedPrice(
        country: person.currentCountry,
        basePrice: TattooUtils.getTattooBasePrice(
          tattooBodyLocation: tattooBodyLocation,
          tattooSize: tattooSize,
          tattooShop: tattooShop,
        ),
      );

      //check if person can afford tattoo
      final bool playerCanAffordTattoo =
          await _checkIfPlayerCanAffordItUsecase.execute(
        personID: personID,
        basePrice: economyAdjustedCost,
        adjustToEconomy: false,
      );

      //player can NOT afford it
      if (!playerCanAffordTattoo) {
        //set entries
        resultTitle = "Where's the money?";
        resultDescription =
            "You do not have enough money to pay for a ${tattooSize.presentationName.toLowerCase()} tattoo of: \"$tattooDescription\" on your ${tattooBodyLocation.presentationName.toLowerCase()}.";
        journalEntry =
            "I tried to get a ${tattooSize.presentationName.toLowerCase()} tattoo of: \"$tattooDescription\" on my ${tattooBodyLocation.presentationName.toLowerCase()} but I don't have enough money.";
      }
      //player can afford it
      else {
        //take money
        await _takeMoneyFromPlayerUsecase.execute(
          mainPlayerID: personID,
          baseAmountToTake: economyAdjustedCost,
          adjustToEconomy: false,
        );

        //get quality
        late final TattooQuality tattooQuality;

        //is tattoo botched?
        final bool botchedQuality =
            Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: tattooShop.botchedChance,
        );

        if (botchedQuality) {
          tattooQuality = TattooQuality.botched;
        } else {
          //is tattoo artistic?
          final bool artisticQuality =
              Chance.getTrueOrFalseBasedOnPercentageChance(
            trueChancePercentage: tattooShop.artisticChance,
          );

          tattooQuality =
              (artisticQuality) ? TattooQuality.artistic : TattooQuality.simple;
        }

        //add tattoo to database
        await _tattooRepository.createTattoo(
          Tattoo(
            id: DatabaseConstants.dummyId,
            personId: personID,
            description: tattooDescription,
            location: tattooBodyLocation.name,
            size: tattooSize.name,
            dayObtained: currentDay,
            quality: tattooQuality.name,
          ),
        );

        //set entries
        resultTitle = "Tatted Up!";
        resultDescription =
            "Your ${tattooQuality.name.toLowerCase()} ${tattooBodyLocation.presentationName.toLowerCase()} tattoo of: \"$tattooDescription\" is complete.";
        journalEntry =
            "I got ${tattooQuality.presentationName.toLowerCase()}, ${tattooSize.presentationName.toLowerCase()} tattoo of: \"$tattooDescription\" on my ${tattooBodyLocation.presentationName.toLowerCase()}.";
      }

      //log in journal
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: gameID,
        day: currentDay,
        mainPlayerID: personID,
        entry: journalEntry,
      );

      //return result dialog
      return _dialogHandler.showResultDialog(
        title: resultTitle,
        result: resultDescription,
      );
    }
  }
}
