import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

void main() {
  group("Dialog Constants:", () {
    test("barrier color is correct", () {
      expect(
        DialogConstants.barrierColor,
        const Color.fromARGB(194, 0, 0, 0),
      );
    });

    test("border width is correct", () {
      expect(
        DialogConstants.borderWidth,
        2.0,
      );
    });

    test("border radius is correct", () {
      expect(
        DialogConstants.borderRadius,
        4.0,
      );
    });

    test("horizontal content padding is correct", () {
      expect(
        DialogConstants.horizontalContentPadding,
        18.0,
      );
    });

    test("vertical content padding is correct", () {
      expect(
        DialogConstants.verticalContentPadding,
        24.0,
      );
    });

    test("vertical choice button spacing is correct", () {
      expect(
        DialogConstants.verticalChoiceButtonSpacing,
        4.0,
      );
    });

    test("vertical description button spacing is correct", () {
      expect(
        DialogConstants.verticalDescriptionButtonSpacing,
        16.0,
      );
    });

    test("vertical dropdown spacing is correct", () {
      expect(
        DialogConstants.verticalDropdownSpacing,
        16.0,
      );
    });

    test("vertical text text spacing is correct", () {
      expect(
        DialogConstants.verticalTextTextSpacing,
        12.0,
      );
    });

    test("dropdown menu max height is correct", () {
      expect(
        DialogConstants.dropdownMenuMaxHeight,
        180.0,
      );
    });

    test("default body text style is correct", () {
      expect(
        DialogConstants.defaultBodyTextStyle,
        const TextStyle(
          fontSize: 14.0,
          height: 1.3,
        ),
      );
    });

    test("dialog descriptor text style is correct", () {
      expect(
        DialogConstants.dialogDescriptorTextStyle,
        const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );
    });
  });
}
