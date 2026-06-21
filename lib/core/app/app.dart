import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../theme/sh_theme.dart';

class ChamaApp extends StatelessWidget {
  const ChamaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chama',
          theme: SHTheme.dark,

          // theme: ThemeData(
          //   // primarySwatch: Colors.blue,
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          //   fontFamily: 'paypal',
          // ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
