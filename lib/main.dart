import 'package:attendy/common/common.dart';
import 'package:attendy/features/auth/controller/auth_controller.dart';
import 'package:attendy/features/auth/view/login_view.dart';
import 'package:attendy/features/home/view/home_view.dart';
import 'package:attendy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              if (user != null){
                return const HomeView();
              }
              return const LoginView();
            },
            error: (error, stackTrace) => ErrorPage(error: error.toString()),
            loading: () {
              return null;
            },
          ),
    );
  }
}













