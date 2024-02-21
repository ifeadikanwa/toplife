import 'package:toplife/core/data_source/drift_database/database_provider.dart';

int getSumCountOfItems(List<StoreroomItem> items) {
  int sum = 0;

  for (var item in items) {
    //if counts left is a negative number add 0
    sum += (item.countsLeft > 0) ? item.countsLeft : 0;
  }

  return sum;
}
