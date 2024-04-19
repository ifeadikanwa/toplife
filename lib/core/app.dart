import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/config/theme/app_theme.dart';
import 'package:toplife/core/common_states/navigation/app_router_provider.dart';
import 'package:toplife/core/text_constants.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //get the app router singleton
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: TextConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.vintageBrownTheme,
      routerConfig: appRouter.config(),
    );
  }
}
