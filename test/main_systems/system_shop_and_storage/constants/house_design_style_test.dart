// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/house_design_style.dart';

void main() {
  group("House design style", () {
    test("minimalist is a house design style", () {
      assert(HouseDesignStyle.Minimalist is HouseDesignStyle);
    });

    test("rustic is a house design style", () {
      assert(HouseDesignStyle.Rustic is HouseDesignStyle);
    });

    test("bohemian is a house design style", () {
      assert(HouseDesignStyle.Bohemian is HouseDesignStyle);
    });

    test("industrial is a house design style", () {
      assert(HouseDesignStyle.Industrial is HouseDesignStyle);
    });

    test("country is a house design style", () {
      assert(HouseDesignStyle.Country is HouseDesignStyle);
    });

    test("chic is a house design style", () {
      assert(HouseDesignStyle.Chic is HouseDesignStyle);
    });

    test("midcentury is a house design style", () {
      assert(HouseDesignStyle.Midcentury is HouseDesignStyle);
    });

    test("contemporary is a house design style", () {
      assert(HouseDesignStyle.Contemporary is HouseDesignStyle);
    });

    test("traditional is a house design style", () {
      assert(HouseDesignStyle.Traditional is HouseDesignStyle);
    });

    test("modern is a house design style", () {
      assert(HouseDesignStyle.Modern is HouseDesignStyle);
    });

    test("maximalist is a house design style", () {
      assert(HouseDesignStyle.Maximalist is HouseDesignStyle);
    });

    test("tropical is a house design style", () {
      assert(HouseDesignStyle.Tropical is HouseDesignStyle);
    });
  });
}
