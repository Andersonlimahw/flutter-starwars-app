import 'package:flutter/material.dart';
import 'package:lemonstarwars/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LemonStarWars", 
      home: SplashPage(),
    );
  }
}