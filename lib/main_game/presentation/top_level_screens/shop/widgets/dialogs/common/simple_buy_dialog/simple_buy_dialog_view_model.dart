import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleBuyDialogViewModelProvider =
    StateNotifierProvider.autoDispose<SimpleBuyDialogViewModel, int>((ref) {
  return SimpleBuyDialogViewModel();
});

class SimpleBuyDialogViewModel extends StateNotifier<int> {
  //state = quantity. intialize state with 1
  SimpleBuyDialogViewModel() : super(1);

  void increaseQuantity() {
    if (state < 10) {
      state++;
    }
  }

  void decreaseQuantity() {
    if (state > 1) {
      state--;
    }
  }
}
