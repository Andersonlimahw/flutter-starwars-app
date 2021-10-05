import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_colors.dart';

import 'core/app_widget.dart';

void main() {
  runApp(const AppWidget());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      title: 'Lemon Star Wars app',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        backgroundColor: AppColors.primaryTextColor,
        splashColor: AppColors.primaryTextColor,       
        appBarTheme: Theme.of(context)
          .appBarTheme
          .copyWith(
            brightness: Brightness.dark, 
            color: Colors.black,
            backgroundColor: Colors.black,
            foregroundColor: Colors.black
          )
      ),
      home: const AppWidget(),
    );
  }
}
