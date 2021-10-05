import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';
import 'package:lemonstarwars/core/core.dart';

class ProfileAppBarWidget extends PreferredSize {
  final String title;
  final String subtitle;
  final String image;
  final double heigth;
  final String profileImage;

  ProfileAppBarWidget(
      {this.title = "",
      this.subtitle = "",
      this.image = "assets/images/profile_banner.png",
      this.heigth = 280, 
      this.profileImage = "assets/icon/icon.png",
    })
      : super(
            preferredSize: Size.fromHeight(heigth),
            child: SafeArea(
              top: true,
              child: Container(
                  color: Colors.black,
                  height: heigth,
                  padding: const EdgeInsets.all(0.0),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: heigth,
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
                          left: 24,
                          bottom: 16,
                          child: Container(
                            padding: const EdgeInsets.all(8),                            
                            child: Text.rich(
                              (TextSpan(
                                  text: title,
                                  style: AppTextStyles.headingStarWarsSecondary,
                                  children: [
                                    TextSpan(
                                      text: "\n$subtitle",
                                      style: AppTextStyles
                                          .bodyLightStarWarsSmallSecondary,
                                    ),
                                  ])),
                            ),
                          )),
                          Positioned(
                          left: 24,
                          bottom: 110,
                          child: Container(
                            height: 88,
                            width: 88,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(4),
                            foregroundDecoration: BoxDecoration(
                              // gradient: AppGradients.linear,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  fit: BoxFit.cover, 
                                  image: AssetImage(profileImage)),
                            ),
                        ),
                        )
                    ],
                  )),
            ));
}
