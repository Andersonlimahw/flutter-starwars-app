import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';
import 'package:lemonstarwars/core/core.dart';

class AppBarWidget extends PreferredSize {
  final String title;
  final String subtitle;
  final String image;

  AppBarWidget({
    this.title = "",
    this.subtitle = "",
    this.image = "assets/images/banner.jpg",
  }) : super(
            preferredSize: Size.fromHeight(380),
            child: SafeArea(
              top: true,
              child: Container(
                  height: 380,
                  padding: const EdgeInsets.all(0.0),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 380,
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          foregroundDecoration: BoxDecoration(
                            gradient: AppGradients.linear,
                            image: DecorationImage(
                                fit: BoxFit.fill, image: AssetImage(image)),
                          ),
                        ),
                      ),                   
                      Positioned(
                          left: 16,
                          bottom: 16,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                // color: AppColors.mirrorSecondary,
                                border: Border.all(color: Colors.transparent)),
                            child: Text.rich((TextSpan(
                                text: title,
                                style: AppTextStyles.headingStarWarsSecondary,
                                children: [
                                  TextSpan(
                                    text: "\n$subtitle",
                                    style: AppTextStyles
                                        .bodyLightStarWarsSmallSecondary,
                                  ),
                                ]))),
                          ))
                    ],
                  )),
            ));
}