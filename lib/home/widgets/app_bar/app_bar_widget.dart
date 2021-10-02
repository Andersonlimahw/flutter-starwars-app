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
                    Container(
                      height: 350,
                      width: double.maxFinite,
                      alignment: Alignment.bottomCenter,
                      foregroundDecoration: BoxDecoration(
                        gradient: AppGradients.linear,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AppImages.banner)),
                      ),                     
                      child: Align(
                        alignment: Alignment(0.0, 1.0),
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
