import 'package:flutter/cupertino.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';
import 'package:lemonstarwars/core/core.dart';

class AppBarWidget extends PreferredSize {
  final String title;

  AppBarWidget({this.title = "Star Wars"})
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
                height: 250,
                padding: const EdgeInsets.all(0.0),
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        gradient: AppGradients.linear,
                        image: DecorationImage(
                            image: AssetImage(AppImages.banner)),
                      ),
                      child: Align(
                        alignment: Alignment(0.0, 0.9),
                        child: Text.rich((TextSpan(
                            text: title,
                            style: AppTextStyles.appBarTitle,
                            children: [
                              TextSpan(
                                text: "",
                                style: AppTextStyles.bodyBoldStarWarsSecondary,
                              ),
                            ]))),
                      ),
                    ),
                  ],
                )));
}
