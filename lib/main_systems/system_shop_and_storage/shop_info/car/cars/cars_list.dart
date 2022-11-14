import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/convertibles.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/minivans.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/sedans.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/sportscars.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/suvs.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/trucks.dart';

class CarsList {
  static List<Car> getShuffledSportsCarsList() {
    final sportsCarsList = sportsCars.toList();
    sportsCarsList.shuffle();
    return sportsCarsList;
  }

  static List<Car> getShuffledConvertiblesList() {
    final convertiblesList = convertibles.toList();
    convertiblesList.shuffle();
    return convertiblesList;
  }

  static List<Car> getShuffledSUVList() {
    final suvsList = suvs.toList();
    suvsList.shuffle();
    return suvsList;
  }

  static List<Car> getShuffledSedansList() {
    final sedansList = sedans.toList();
    sedansList.shuffle();
    return sedansList;
  }

  static List<Car> getShuffledTrucksList() {
    final trucksList = trucks.toList();
    trucksList.shuffle();
    return trucksList;
  }

  static List<Car> getShuffledMinivansList() {
    final minivansList = minivans.toList();
    minivansList.shuffle();
    return minivansList;
  }
}
