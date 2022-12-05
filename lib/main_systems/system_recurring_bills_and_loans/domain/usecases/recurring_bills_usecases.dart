import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/repository/recurring_bill_repository.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/add_car_loan_to_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/car_loan_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/car_loan_recurring_payment_calculator_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/car/remove_car_loan_from_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/add_mortgage_loan_to_bills_usecase.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/loans/house/add_property_tax_to_bills_usecase.dart';
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
  final RecurringBillRepository _recurringBillRepository;
  final GameUsecases _gameUsecases;
  final PersonUsecases _personUsecases;

  const RecurringBillsUsecases({
    required RecurringBillRepository recurringBillRepository,
    required GameUsecases gameUsecases,
    required PersonUsecases personUsecases,
  })  : _recurringBillRepository = recurringBillRepository,
        _gameUsecases = gameUsecases,
        _personUsecases = personUsecases;

  AddRentToBillsUsecase get addRentToBillsUsecase => AddRentToBillsUsecase(
        _recurringBillRepository,
        _gameUsecases,
      );

  RemoveRentFromBillsUsecase get removeRentFromBillsUsecase =>
      RemoveRentFromBillsUsecase(
        _recurringBillRepository,
      );

  AddCarLoanToBillsUsecase get addCarLoanToBillsUsecase =>
      AddCarLoanToBillsUsecase(
        _recurringBillRepository,
        _personUsecases,
        _gameUsecases,
        carLoanCalculatorUsecase,
        carLoanRecurringPaymentCalculatorUsecase,
      );

  RemoveCarLoanFromBillsUsecase get removeCarLoanFromBillsUsecase =>
      RemoveCarLoanFromBillsUsecase(_recurringBillRepository);

  AddMortgageLoanToBillsUsecase get addMortgageLoanToBillsUsecase =>
      AddMortgageLoanToBillsUsecase(
        _recurringBillRepository,
        _personUsecases,
        _gameUsecases,
        mortgageLoanCalculatorUsecase,
        mortgageLoanRecurringPaymentCalculatorUsecase,
      );

  RemoveMortgageLoanFromBillsUsecase get removeMortgageLoanFromBillsUsecase =>
      RemoveMortgageLoanFromBillsUsecase(_recurringBillRepository);

  AddPropertyTaxToBillsUsecase get addPropertyTaxToBillsUsecase =>
      AddPropertyTaxToBillsUsecase(
        _recurringBillRepository,
        _gameUsecases,
      );

  RemovePropertyTaxFromBillsUsecase get removePropertyTaxFromBillsUsecase =>
      RemovePropertyTaxFromBillsUsecase(_recurringBillRepository);

  AddStudentLoanToBillsUsecase get addStudentLoanToBillsUsecase =>
      AddStudentLoanToBillsUsecase(
        _recurringBillRepository,
        _personUsecases,
        _gameUsecases,
        studentLoanCalculatorUsecase,
        studentLoanRecurringPaymentCalculatorUsecase,
      );

  RemoveStudentLoanFromBillsUsecase get removeStudentLoanFromBillsUsecase =>
      RemoveStudentLoanFromBillsUsecase(_recurringBillRepository);

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
}
