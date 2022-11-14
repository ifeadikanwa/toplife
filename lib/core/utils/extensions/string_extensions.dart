import 'package:flutter/material.dart';

extension StringExtensions on String {
  String prepareTextToEllipsize() {
    return Characters(this)
        .replaceAll(Characters(''), Characters('\u{200B}'))
        .toString();
  }
}
