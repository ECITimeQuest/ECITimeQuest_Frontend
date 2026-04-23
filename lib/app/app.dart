import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_theme.dart';
import 'package:flutter_app/features/auth/presentation/pages/auth_page.dart';
// import 'package:flutter_app/features/home/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TimeQuest",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: const AuthPage(),
    );
  }
}
