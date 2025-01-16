import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/config/routing/app_router.dart';
import 'package:toplife/core/common_states/navigation/navigator_key_provider.dart';

part 'app_router_provider.g.dart';

@riverpod
// this is just a regular provider not a changenotifier so we don't need to notify anyone
// ignore: unsupported_provider_value
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter(navigatorKey: ref.watch(navigatorKeyProvider));
}
