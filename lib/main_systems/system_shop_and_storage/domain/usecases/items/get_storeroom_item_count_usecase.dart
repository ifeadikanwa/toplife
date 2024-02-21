import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/storeroom_item_repository.dart';

class GetStoreroomItemCountUsecase {
  final StoreroomItemRepository _storeroomItemRepository;
  const GetStoreroomItemCountUsecase(this._storeroomItemRepository);

  Future<int> execute({
    required int personID,
  }) async {
    //get all storeroom item
    final allStoreroomItems =
        await _storeroomItemRepository.getAllStoreroomItems(
      personID,
    );

    //get the sum of counts left in storeroom items
    int sum = 0;

    for (var storeroomItem in allStoreroomItems) {
      sum += storeroomItem.countsLeft;
    }

    return sum;
  }
}
