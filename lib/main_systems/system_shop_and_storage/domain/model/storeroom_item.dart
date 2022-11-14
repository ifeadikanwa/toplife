import 'package:equatable/equatable.dart';

class StoreroomItem extends Equatable {
  final int? id;
  final int personID;
  final int itemID;
  final int countsLeft;

  const StoreroomItem({
    this.id,
    required this.personID,
    required this.itemID,
    required this.countsLeft,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        itemID,
        countsLeft,
      ];

  @override
  bool? get stringify => true;

  //helper constants
  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const itemIDColumn = "itemID";
  static const countsLeftColumn = "countsLeft";


  static const allColumns = [
    idColumn,
    personIDColumn,
    itemIDColumn,
    countsLeftColumn,
   
  ];

  static StoreroomItem fromMap({required Map<String, Object?> storeroomItemMap}) {
    return StoreroomItem(
      id: storeroomItemMap[idColumn] as int?,
      personID: storeroomItemMap[personIDColumn] as int,
      itemID: storeroomItemMap[itemIDColumn] as int,
      countsLeft: storeroomItemMap[countsLeftColumn] as int,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      itemIDColumn: itemID,
      countsLeftColumn: countsLeft,
    };
  }

  StoreroomItem copyWith({
    int? id,
    int? personID,
    int? itemID,
    int? countsLeft,
  }) {
    return StoreroomItem(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      itemID: itemID ?? this.itemID,
      countsLeft: countsLeft ?? this.countsLeft,
    );
  }
}
