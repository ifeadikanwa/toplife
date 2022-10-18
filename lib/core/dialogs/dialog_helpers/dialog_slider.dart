import 'package:flutter/material.dart';

class DialogSlider extends StatelessWidget {
  final double value;
  final double max;
  final void Function(double)? onChanged;
  const DialogSlider({
    Key? key,
    required this.value,
    required this.max,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return SliderTheme(
      data: SliderThemeData(
        thumbColor: appTheme.colorScheme.tertiary,
        activeTrackColor: appTheme.colorScheme.tertiary,
        inactiveTrackColor: (appTheme.brightness == Brightness.light)
            ? Colors.black.withOpacity(0.3)
            : Colors.white.withOpacity(0.3),
      ),
      child: Slider(
        value: value,
        max: max,
        onChanged: onChanged,
      ),
    );
  }
}
