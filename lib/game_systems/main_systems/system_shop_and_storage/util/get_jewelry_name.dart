import 'package:intl/intl.dart';

String getJewelryName({
  required String jewel,
  required String type,
}) {
  return "$jewel ${toBeginningOfSentenceCase(type)}";
}
