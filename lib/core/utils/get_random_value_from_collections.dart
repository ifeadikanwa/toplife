import 'dart:collection';
import 'dart:math';

T getRandomValueFromHashSet<T>({required HashSet<T> hashSet}) {
  int randomIndex = Random().nextInt(hashSet.length);
  return hashSet.elementAt(randomIndex);
}

T getRandomValueFromList<T>({required List<T> list}) {
  int randomIndex = Random().nextInt(list.length);
  return list.elementAt(randomIndex);
}
