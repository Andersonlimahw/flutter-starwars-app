import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lemonstarwars/core/app_colors.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color backGroundColor;
  final Color fontColor;
  final Color borderColor;

  final VoidCallback onTap;

  const ButtonWidget({
    Key? key,
    required this.label,
    required this.backGroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  ButtonWidget.primary({ required String label, required VoidCallback onTap }): 
    this.backGroundColor = 
    AppColors.primaryColorDark, 
    this.fontColor = AppColors.primaryTextColor,
    this.borderColor = AppColors.primaryColorDark,
    this.label = label,
    this.onTap = onTap;

  ButtonWidget.secondary({ required String label , required VoidCallback onTap }): 
    this.backGroundColor = 
    AppColors.primaryColorLight, 
    this.fontColor = AppColors.secondaryTextColor,
    this.borderColor = AppColors.primaryColorLight,
    this.label = label,
    this.onTap = onTap;

  ButtonWidget.accent({ required String label , required VoidCallback onTap }): 
    this.backGroundColor = 
    AppColors.accentColor, 
    this.fontColor = AppColors.secondaryTextColor,
    this.borderColor = AppColors.accentColor,
    this.label = label,
    this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backGroundColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          side: MaterialStateProperty.all(BorderSide(color: borderColor))
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: AppTextStyles.bodyBold,
        ),
      ),
    );
  }
}
