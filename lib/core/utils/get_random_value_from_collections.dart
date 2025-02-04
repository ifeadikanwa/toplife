import 'dart:math';

T getRandomValueFromSet<T>({required Set<T> set}) {
  int randomIndex = Random().nextInt(set.length);
  return set.elementAt(randomIndex);
}

T getRandomValueFromList<T>({required List<T> list}) {
  int randomIndex = Random().nextInt(list.length);
  return list.elementAt(randomIndex);
}
