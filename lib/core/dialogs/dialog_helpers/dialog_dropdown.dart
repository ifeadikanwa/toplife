import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';

class DialogDropdown<T> extends StatelessWidget {
  final T value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  const DialogDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

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
      scrollbarAlwaysShow: true,
      style: DialogConstants.defaultBodyTextStyle.copyWith(
        color: (appTheme.brightness == Brightness.light)
            ? Colors.black
            : Colors.white,
      ),
      dropdownMaxHeight: DialogConstants.dropdownMenuMaxHeight,
      dropdownDecoration: BoxDecoration(
        color: appTheme.cardTheme.color,
        border: Border(
          left: dropDownBorder,
          right: dropDownBorder,
          bottom: dropDownBorder,
        ),
      ),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
