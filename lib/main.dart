import 'package:chama/features/login_page.dart';
import 'package:chama/features/navigation_menu.dart';
import 'package:chama/features/settings_page.dart';
import 'package:chama/home_page.dart';
import 'package:chama/verifty_phone.dart';
import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'features/generate_statement_page.dart';
import 'features/transactions_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          Color(0xFFa52b29).value,
          <int, Color>{
            50: Color(0xFFa52b29),
            100: Color(0xFFa52b29),
            200: Color(0xFFa52b29),
            300: Color(0xFFa52b29),
            400: Color(0xFFa52b29),
            500: Color(0xFFa52b29),
            600: Color(0xFFa52b29),
            700: Color(0xFFa52b29),
            800: Color(0xFFa52b29),
            900: Color(0xFFa52b29),
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'paypal',
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
