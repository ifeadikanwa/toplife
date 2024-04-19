import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/bill_type.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/get_calculated_car_loan_information_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/get_calculated_mortgage_loan_information_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/school/get_calculated_student_loan_information_usecase.dart';

class GetCalculatedLoanInformationUsingBillTypeUsecase {
  final GetCalculatedStudentLoanInformationUsecase
      _getCalculatedStudentLoanInformationUsecase;
  final GetCalculatedMortgageLoanInformationUsecase
      _getCalculatedMortgageLoanInformationUsecase;

  final GetCalculatedCarLoanInformationUsecase
      _getCalculatedCarLoanInformationUsecase;

  const GetCalculatedLoanInformationUsingBillTypeUsecase(
    this._getCalculatedStudentLoanInformationUsecase,
    this._getCalculatedMortgageLoanInformationUsecase,
    this._getCalculatedCarLoanInformationUsecase,
  );

  Future<EconomyAdjustedLoanInformation> execute({
    required int currentPlayerID,
    required int downPaymentPercentage,
    required int basePrice,
    required BillType billType,
  }) async {
    switch (billType) {
      case BillType.carLoan:
        return _getCalculatedCarLoanInformationUsecase.execute(
          currentPlayerID: currentPlayerID,
          downPaymentPercentage: downPaymentPercentage,
          basePrice: basePrice,
        );
      case BillType.mortgageLoan:
        return _getCalculatedMortgageLoanInformationUsecase.execute(
          currentPlayerID: currentPlayerID,
          downPaymentPercentage: downPaymentPercentage,
          basePrice: basePrice,
        );
      case BillType.studentLoan:
        return _getCalculatedStudentLoanInformationUsecase.execute(
          currentPlayerID: currentPlayerID,
          downPaymentPercentage: downPaymentPercentage,
          basePrice: basePrice,
        );
      default:
        return EconomyAdjustedLoanInformation.blankLoanInformation;
    }
  }
}
