import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

final carLoanDialogViewModelProvider = Provider<CarLoanDialogViewModel>((ref) {
  //get recent
  final shopAndStorageUsecases = ref.watch(shopAndStorageUsecasesProvider);

  return CarLoanDialogViewModel(
    shopAndStorageUsecases: shopAndStorageUsecases,
  );
});

class CarLoanDialogViewModel {
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  CarLoanDialogViewModel({
    required ShopAndStorageUsecases shopAndStorageUsecases,
  }) : _shopAndStorageUsecases = shopAndStorageUsecases;

  void applyForCarLoan(
    BuildContext context,
    int personID,
    Car car,
    int downPaymentPercentage,
  ) {
    _shopAndStorageUsecases.purchaseCarWithLoanUsecase.execute(
      context: context,
      car: car,
      downPaymentPercentage: downPaymentPercentage,
      personID: personID,
    );
  }
}
