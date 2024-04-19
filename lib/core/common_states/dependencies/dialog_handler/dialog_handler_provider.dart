import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/navigation/navigator_key_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';

part 'dialog_handler_provider.g.dart';

@riverpod
DialogHandler dialogHandler(DialogHandlerRef ref) {
  return DialogHandler(navigatorKey: ref.watch(navigatorKeyProvider));
}
