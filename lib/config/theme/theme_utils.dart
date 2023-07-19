import 'package:flutter/material.dart';

class ThemeUtils {
 static InputDecorationTheme getInputDecorationTheme({required Color tertiaryColor}) {
    return InputDecorationTheme(
      
      border: const UnderlineInputBorder(),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: tertiaryColor,
        ),
      ),
    );
  }
}
