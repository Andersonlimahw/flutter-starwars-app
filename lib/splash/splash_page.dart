import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_images.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) => 
      print("Delay splashPage") // TODO: Adicionar HomePage
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear
        ),
        child: Center(
          child: Text(
            "Star\nWars",
            style: AppTextStyles.splashTitle,
          ),
        ),
      )
    );
  }
}