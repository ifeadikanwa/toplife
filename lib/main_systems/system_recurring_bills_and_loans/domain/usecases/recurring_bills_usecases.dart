import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/recurring_bill/recurring_bill_dependencies_providers.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/base_loan_amount_calculator.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/add_car_loan_to_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/car_loan_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/car_loan_recurring_payment_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/check_if_there_is_an_existing_car_loan_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/remove_car_loan_from_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/base_down_payment_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/add_mortgage_loan_to_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/add_property_tax_to_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/check_if_there_is_an_existing_mortgage_loan_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/mortgage_loan_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/mortgage_loan_recurring_payment_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/remove_mortgage_loan_from_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/remove_property_tax_from_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/school/add_student_loan_to_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/school/remove_student_loan_from_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/school/student_loan_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/school/student_loan_recurring_payment_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/regular/add_rent_to_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/regular/remove_rent_from_bills_usecase.dart';

class RecurringBillsUsecases {
  final Ref _ref;

  const RecurringBillsUsecases({required Ref ref}) : _ref = ref;

  AddRentToBillsUsecase get addRentToBillsUsecase => AddRentToBillsUsecase(
        _ref.read(recurringBillRepositoryProvider),
        _ref.read(gameUsecasesProvider),
      );

  RemoveRentFromBillsUsecase get removeRentFromBillsUsecase =>
      RemoveRentFromBillsUsecase(
        _ref.read(recurringBillRepositoryProvider),
      );

  AddCarLoanToBillsUsecase get addCarLoanToBillsUsecase =>
      AddCarLoanToBillsUsecase(
        _ref.read(recurringBillRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        carLoanCalculatorUsecase,
        carLoanRecurringPaymentCalculatorUsecase,
      );

  RemoveCarLoanFromBillsUsecase get removeCarLoanFromBillsUsecase =>
      RemoveCarLoanFromBillsUsecase(_ref.read(recurringBillRepositoryProvider));

  AddMortgageLoanToBillsUsecase get addMortgageLoanToBillsUsecase =>
      AddMortgageLoanToBillsUsecase(
        _ref.read(recurringBillRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        mortgageLoanCalculatorUsecase,
        mortgageLoanRecurringPaymentCalculatorUsecase,
      );

  RemoveMortgageLoanFromBillsUsecase get removeMortgageLoanFromBillsUsecase =>
      RemoveMortgageLoanFromBillsUsecase(
          _ref.read(recurringBillRepositoryProvider));

  AddPropertyTaxToBillsUsecase get addPropertyTaxToBillsUsecase =>
      AddPropertyTaxToBillsUsecase(
        _ref.read(recurringBillRepositoryProvider),
        _ref.read(gameUsecasesProvider),
      );

  RemovePropertyTaxFromBillsUsecase get removePropertyTaxFromBillsUsecase =>
      RemovePropertyTaxFromBillsUsecase(
          _ref.read(recurringBillRepositoryProvider));

  AddStudentLoanToBillsUsecase get addStudentLoanToBillsUsecase =>
      AddStudentLoanToBillsUsecase(
        _ref.read(recurringBillRepositoryProvider),
        _ref.read(personUsecasesProvider),
        _ref.read(gameUsecasesProvider),
        studentLoanCalculatorUsecase,
        studentLoanRecurringPaymentCalculatorUsecase,
      );

  RemoveStudentLoanFromBillsUsecase get removeStudentLoanFromBillsUsecase =>
      RemoveStudentLoanFromBillsUsecase(
          _ref.read(recurringBillRepositoryProvider));

  CarLoanCalculatorUsecase get carLoanCalculatorUsecase =>
      CarLoanCalculatorUsecase();

  MortgageLoanCalculatorUsecase get mortgageLoanCalculatorUsecase =>
      MortgageLoanCalculatorUsecase();

  StudentLoanCalculatorUsecase get studentLoanCalculatorUsecase =>
      StudentLoanCalculatorUsecase();

  CarLoanRecurringPaymentCalculatorUsecase
      get carLoanRecurringPaymentCalculatorUsecase =>
          CarLoanRecurringPaymentCalculatorUsecase(carLoanCalculatorUsecase);

  MortgageLoanRecurringPaymentCalculatorUsecase
      get mortgageLoanRecurringPaymentCalculatorUsecase =>
          MortgageLoanRecurringPaymentCalculatorUsecase(
              mortgageLoanCalculatorUsecase);

  StudentLoanRecurringPaymentCalculatorUsecase
      get studentLoanRecurringPaymentCalculatorUsecase =>
          StudentLoanRecurringPaymentCalculatorUsecase(
              studentLoanCalculatorUsecase);

  CheckIfThereIsAnExistingCarLoanUsecase
      get checkIfThereIsAnExistingCarLoanUsecase =>
          CheckIfThereIsAnExistingCarLoanUsecase(
            _ref.read(recurringBillRepositoryProvider),
          );

  CheckIfThereIsAnExistingMortgageLoanUsecase
      get checkIfThereIsAnExistingMortgageLoanUsecase =>
          CheckIfThereIsAnExistingMortgageLoanUsecase(
            _ref.read(recurringBillRepositoryProvider),
          );

  BaseDownPaymentCalculatorUsecase get baseDownPaymentCalculatorUsecase =>
      BaseDownPaymentCalculatorUsecase();

  BaseLoanAmountCalculatorUsecase get baseLoanAmountCalculatorUsecase =>
      BaseLoanAmountCalculatorUsecase();
}
