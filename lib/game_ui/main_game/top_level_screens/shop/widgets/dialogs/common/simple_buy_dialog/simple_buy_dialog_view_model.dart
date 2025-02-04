import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simple_buy_dialog_view_model.g.dart';

@riverpod
class SimpleBuyDialogViewModel extends _$SimpleBuyDialogViewModel {
  //state = quantity. initialize state with 1
  @override
  int build() {
    return 1;
  }

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
