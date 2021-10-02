import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';
import 'package:lemonstarwars/core/core.dart';

class AppBarWidget extends PreferredSize {
  final String title;
  final String subtitle;
  final String image;

  AppBarWidget(
      { this.title = "",
        this.subtitle = "",
        this.image = "assets/images/banner.jpg",
      })
      : super(
            preferredSize: Size.fromHeight(350),
            child: SafeArea(
              top: true,
              child: Container(
                  height: 350,
                  padding: const EdgeInsets.all(0.0),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 350,
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
                                border: Border.all(
                                    color: AppColors.secondaryTextColor)),
                            child: Text.rich((TextSpan(
                                text: title,
                                style: AppTextStyles.headingStarWarsSecondary,
                                children: [
                                  TextSpan(
                                    text: "\n$subtitle",
                                    style: AppTextStyles.bodyLightStarWarsSmallSecondary,
                                  ),
                                ]))),
                          ))
                    ],
                  )),
            ));
}
