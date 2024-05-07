import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/get/player_and_game/formatted_money_provider.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/game_systems/main_systems/system_event/domain/model/info_models/funeral_event_detail.dart';

part 'player_planned_funeral_dialog_view_model.g.dart';

@CopyWith()
class PlayerPlannedFuneralDialogData extends Equatable {
  final FuneralEventDetail funeralEventDetail;
  final String funeralCostString;

  const PlayerPlannedFuneralDialogData({
    required this.funeralEventDetail,
    required this.funeralCostString,
  });

  @override
  List<Object?> get props => [
        funeralEventDetail,
        funeralCostString,
      ];
}

@riverpod
class PlayerPlannedFuneralDialogViewModel
    extends _$PlayerPlannedFuneralDialogViewModel {
  static const adjustFuneralCostToEconomy = true;

  @override
  Future<PlayerPlannedFuneralDialogData> build() async {
    final FuneralEventDetail funeralDetails = FuneralEventDetail(
      funeralType: FuneralType.Burial,
      funeralChosenDaysFromCurrentDay:
          FuneralEventDetail.possibleFuneralDaysFromCurrentDay.first,
      funeralStartTime: FuneralEventDetail.possibleFuneralStartTimes.first,
    );

    return PlayerPlannedFuneralDialogData(
      funeralEventDetail: funeralDetails,
      funeralCostString: await ref.watch(
        formattedMoneyProvider(
          amount: funeralDetails.funeralType.basePrice,
          adjustToEconomy: adjustFuneralCostToEconomy,
        ).future,
      ),
    );
  }

  void updateFuneralType(FuneralType newFuneralType) async {
    final PlayerPlannedFuneralDialogData? currentData = state.valueOrNull;
    if (currentData != null) {
      state = AsyncData(
        currentData.copyWith(
          funeralCostString: await ref.read(
            formattedMoneyProvider(
              amount: newFuneralType.basePrice,
              adjustToEconomy: adjustFuneralCostToEconomy,
            ).future,
          ),
          funeralEventDetail: currentData.funeralEventDetail
              .copyWith(funeralType: newFuneralType),
        ),
      );
    }
  }

  void updateFuneralChosenDaysFromCurrentDay(
    int newFuneralChosenDaysFromCurrentDay,
  ) {
    final PlayerPlannedFuneralDialogData? currentData = state.valueOrNull;
    if (currentData != null) {
      state = AsyncData(
        currentData.copyWith(
          funeralEventDetail: currentData.funeralEventDetail.copyWith(
            funeralChosenDaysFromCurrentDay: newFuneralChosenDaysFromCurrentDay,
          ),
        ),
      );
    }
  }

  void updateFuneralStartTime(int newFuneralStartTime) {
    final PlayerPlannedFuneralDialogData? currentData = state.valueOrNull;
    if (currentData != null) {
      state = AsyncData(
        currentData.copyWith(
          funeralEventDetail: currentData.funeralEventDetail.copyWith(
            funeralStartTime: newFuneralStartTime,
          ),
        ),
      );
    }
  }
}
