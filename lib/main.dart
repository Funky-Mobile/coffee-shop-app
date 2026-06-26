import 'package:coffee_shop_app/core/constants/app_colors.dart';
import 'package:coffee_shop_app/features/home_screen/views/home_screen_main.dart';
import 'package:flutter/material.dart';

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
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.frothyWhite,
        ),
        scaffoldBackgroundColor: AppColors.frothyWhite,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white
        )
      ),
      home: const HomeScreenMain(),
    );
  }
}
