import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/base_down_payment_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/base_loan_amount_calculator.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/car_loan_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/car_loan_recurring_payment_calculator_usecase.dart';

class GetCalculatedCarLoanInformationUsecase {
  final CarLoanCalculatorUsecase _carLoanCalculatorUsecase;
  final CarLoanRecurringPaymentCalculatorUsecase
      _carLoanRecurringPaymentCalculatorUsecase;
  final BaseDownPaymentCalculatorUsecase _baseDownPaymentCalculatorUsecase;
  final BaseLoanAmountCalculatorUsecase _baseLoanAmountCalculatorUsecase;
  final PersonUsecases _personUsecases;

  const GetCalculatedCarLoanInformationUsecase(
    this._carLoanCalculatorUsecase,
    this._carLoanRecurringPaymentCalculatorUsecase,
    this._baseDownPaymentCalculatorUsecase,
    this._baseLoanAmountCalculatorUsecase,
    this._personUsecases,
  );

  Future<EconomyAdjustedLoanInformation> execute({
    required int currentPlayerID,
    required int downPaymentPercentage,
    required int basePrice,
  }) async {
    //get the currentPlayer
    final Person? playerPerson = await _personUsecases.getPersonUsecase.execute(
      personID: currentPlayerID,
    );

    //if valid
    if (playerPerson != null) {
      //get the base down payment
      final int baseDownPayment = _baseDownPaymentCalculatorUsecase.execute(
        downPaymentPercentage: downPaymentPercentage,
        basePrice: basePrice,
      );

      //get the base loan amount
      final int baseLoanAmount = _baseLoanAmountCalculatorUsecase.execute(
        baseDownPayment: baseDownPayment,
        basePrice: basePrice,
      );

      //get the car loan amount
      final int carLoanAmount = _carLoanCalculatorUsecase.execute(
        baseLoanAmount: baseLoanAmount,
        country: playerPerson.currentCountry,
      );

      //get the installment amount
      final int adjustedInstallment =
          _carLoanRecurringPaymentCalculatorUsecase.execute(
        baseLoanAmount: baseLoanAmount,
        country: playerPerson.currentCountry,
      );

      //get economy adjusted down payment
      final int economyAdjustedDownPayment = getCountryEconomyAdjustedPrice(
        country: playerPerson.currentCountry,
        basePrice: baseDownPayment,
      );

      return EconomyAdjustedLoanInformation(
        downPayment: economyAdjustedDownPayment,
        loan: carLoanAmount,
        installment: adjustedInstallment,
      );
    }

    //return blank info if player is not valid
    return EconomyAdjustedLoanInformation.blankLoanInformation;
  }
}
