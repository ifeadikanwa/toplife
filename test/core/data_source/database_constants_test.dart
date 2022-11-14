import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/database_constants.dart';

void main() {
  group("Database Constants: ", () {
    test("database true value is 1", () {
      expect(databaseTrueValue, 1);
    });

    test("database false value is 0", () {
      expect(databaseFalseValue, 0);
    });

    test("database idType value is INTEGER PRIMARY KEY AUTOINCREMENT", () {
      expect(idType, "INTEGER PRIMARY KEY AUTOINCREMENT");
    });

    test("database booltype value is BOOLEAN NOT NULL", () {
      expect(boolType, "BOOLEAN NOT NULL");
    });

    test("database nullableBoolType value is BOOLEAN NULL", () {
      expect(nullableBoolType, "BOOLEAN NULL");
    });

    test("database integerType value is INTEGER NOT NULL", () {
      expect(integerType, "INTEGER NOT NULL");
    });

    test("database nullableIntegerType value is INTEGER NULL", () {
      expect(nullableIntegerType, "INTEGER NULL");
    });

    test("database textType value is TEXT NOT NULL", () {
      expect(textType, "TEXT NOT NULL");
    });

    test("database nullableTextType value is TEXT NULL", () {
      expect(nullableTextType, "TEXT NULL");
    });

    test("database unique value is UNIQUE", () {
      expect(unique, "UNIQUE");
    });

    test("database dbValueIsNull value is IS NULL", () {
      expect(dbValueIsNull, "IS NULL");
    });
    test("database dbValueIsNotNull value is IS NULL", () {
      expect(dbValueIsNotNull, "IS NOT NULL");
    });
  });
}
