import 'package:flutter/cupertino.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';
import 'package:lemonstarwars/core/core.dart';

class AppBarWidget extends PreferredSize {
  final String title;

  AppBarWidget({this.title = ""})
      : super(
            preferredSize: Size.fromHeight(350),
            child: Container(
                height: 350,
                padding: const EdgeInsets.all(0.0),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 350,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        foregroundDecoration: BoxDecoration(
                          gradient: AppGradients.linear,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(AppImages.banner)),
                        ),
                        child: Align(
                            alignment: Alignment(-0.8, 1.3),
                            child: Text.rich((TextSpan(
                                text: title,
                                style: AppTextStyles.headingStarWarsSecondary,
                                children: [
                                  TextSpan(
                                    text: "",
                                    style: AppTextStyles.bodyBoldSecondary,
                                  ),
                                ]))),
                          ),
                      ),
                    ),
                  ],
                )));
}
