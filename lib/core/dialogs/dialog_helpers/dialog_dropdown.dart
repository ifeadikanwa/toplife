import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

class DialogDropdown<T> extends StatelessWidget {
  final T value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;

  const DialogDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    final BorderSide dropDownBorder = BorderSide(
      width: 0.5,
      color: (appTheme.brightness == Brightness.light)
          ? Colors.black.withOpacity(0.5)
          : Colors.white.withOpacity(0.5),
    );

    return DropdownButton2<T>(
      isExpanded: true,
      dropdownStyleData: DropdownStyleData(
        maxHeight: DialogConstants.dropdownMenuMaxHeight,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStatePropertyAll(appTheme.colorScheme.tertiary),
          thumbVisibility:
              const WidgetStatePropertyAll(true), //always show scrollbar
        ),
        decoration: BoxDecoration(
          color: appTheme.cardTheme.color,
          border: Border(
            left: dropDownBorder,
            right: dropDownBorder,
            bottom: dropDownBorder,
          ),
        ),
      ),
      buttonStyleData: ButtonStyleData(
        decoration: BoxDecoration(
          border: Border(
            bottom: dropDownBorder,
          ),
        ),
      ),
      style: DialogConstants.defaultBodyTextStyle.copyWith(
        color: (appTheme.brightness == Brightness.light)
            ? Colors.black
            : Colors.white,
      ),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
