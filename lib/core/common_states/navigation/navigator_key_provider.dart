import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigator_key_provider.g.dart';

//singleton navigator key we will pass to auto_route. I want to use it only for calling dialogs without context.

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(NavigatorKeyRef ref) {
  return GlobalKey<NavigatorState>();
}
