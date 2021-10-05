import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_colors.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_images.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(
                gradient: AppGradients.linear,
              ),
            ),
          ),
          Positioned(
            child: Container(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.primaryTextColor,
                strokeWidth: 10,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.secondaryTextColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
