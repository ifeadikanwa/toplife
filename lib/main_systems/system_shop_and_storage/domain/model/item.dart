import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int? id;
  final String name;
  final String type;
  final int basePrice;
  final int count;


  const Item({
    this.id,
    required this.name,
    required this.type,
    required this.basePrice,
    required this.count,

  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        basePrice,
        count,
      ];

  @override
  bool? get stringify => true;

  //helper constants
  static const idColumn = "_id";
  static const nameColumn = "name";
  static const typeColumn = "type";
  static const basePriceColumn = "basePrice";
  static const countColumn = "count";


  static const allColumns = [
    idColumn,
    nameColumn,
    typeColumn,
    basePriceColumn,
    countColumn,

  ];

  static Item fromMap({required Map<String, Object?> itemMap}) {
    return Item(
      id: itemMap[idColumn] as int?,
      name: itemMap[nameColumn] as String,
      type: itemMap[typeColumn] as String,
      basePrice: itemMap[basePriceColumn] as int,
      count: itemMap[countColumn] as int,
    
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      nameColumn: name,
      typeColumn: type,
      basePriceColumn: basePrice,
      countColumn: count,
     
    };
  }

  Item copyWith({
    int? id,
    String? name,
    String? type,
    int? basePrice,
    int? count,

  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      basePrice: basePrice ?? this.basePrice,
      count: count ?? this.count,
    );
  }
}
