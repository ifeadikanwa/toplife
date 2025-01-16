import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

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
