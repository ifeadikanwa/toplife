import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';

void main() {
  test("getRandomValueFromHashSet returns value in the hashset", () {
    final set = HashSet.of({"Eat", "Pray", "Love"});
    final value = getRandomValueFromHashSet(hashSet: set);
    assert(set.contains(value));
  });

  test("getRandomValueFromList returns value in the list", () {
    final list =["Eat", "Pray", "Love"];
    final value = getRandomValueFromList(list: list);
    assert(list.contains(value));
  });
}
