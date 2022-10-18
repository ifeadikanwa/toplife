import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/storeroom_item.dart';

class StoreroomItemPair extends Equatable {
  final StoreroomItem storeroomItem;
  final Item item;

  const StoreroomItemPair({
    required this.storeroomItem,
    required this.item,
  });

  @override
  List<Object?> get props => [
        storeroomItem,
        item,
      ];
}
