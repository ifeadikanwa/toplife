import 'package:equatable/equatable.dart';

class FridgeFood extends Equatable {
  final int? id;
  final int personID;
  final int foodID;
  final int servingsLeft;
  final int expiryDay;

  const FridgeFood({
    this.id,
    required this.personID,
    required this.foodID,
    required this.servingsLeft,
    required this.expiryDay,
  });

  @override
  List<Object?> get props => [
        id,
        personID,
        foodID,
        servingsLeft,
        expiryDay,
      ];

  @override
  bool? get stringify => true;

  //helper constants
  static const idColumn = "_id";
  static const personIDColumn = "personID";
  static const foodIDColumn = "foodID";
  static const servingsLeftColumn = "servingsLeft";
  static const expiryDayColumn = "expiryDay";

  static const allColumns = [
    idColumn,
    personIDColumn,
    foodIDColumn,
    servingsLeftColumn,
    expiryDayColumn,
  ];

  static FridgeFood fromMap({required Map<String, Object?> fridgeFoodMap}) {
    return FridgeFood(
      id: fridgeFoodMap[idColumn] as int?,
      personID: fridgeFoodMap[personIDColumn] as int,
      foodID: fridgeFoodMap[foodIDColumn] as int,
      servingsLeft: fridgeFoodMap[servingsLeftColumn] as int,
      expiryDay: fridgeFoodMap[expiryDayColumn] as int,
    );
  }

  Map<String, Object?> toMap() {
    return {
      idColumn: id,
      personIDColumn: personID,
      foodIDColumn: foodID,
      servingsLeftColumn: servingsLeft,
      expiryDayColumn: expiryDay,
    };
  }

  FridgeFood copyWith({
    int? id,
    int? personID,
    int? foodID,
    int? servingsLeft,
    int? expiryDay,
  }) {
    return FridgeFood(
      id: id ?? this.id,
      personID: personID ?? this.personID,
      foodID: foodID ?? this.foodID,
      servingsLeft: servingsLeft ?? this.servingsLeft,
      expiryDay: expiryDay ?? this.expiryDay,
    );
  }
}
