import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';
import 'package:lemonstarwars/core/core.dart';

class ListItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const ListItemWidget(
      {Key? key,
      required this.title,
      required this.description,
      this.image = "-"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultText = Row(children: [
      Expanded(
        child: Container(
          width: 150,
          child: Text.rich(
            (TextSpan(
                text: title,
                style: AppTextStyles.headingMediumSecondary,
                children: [
                  TextSpan(
                    text: "\n$description",
                    style: AppTextStyles.bodySecondary,
                  ),
                ])),
          ),
        ),
      )
    ]);

    var textWithImage = Row(children: [
      Expanded(
        child: Container(
          width: 150,
          child: Text.rich(
            (TextSpan(
                text: title,
                style: AppTextStyles.headingMediumSecondary,
                children: [
                  TextSpan(
                    text: "\n$description",
                    style: AppTextStyles.bodySecondary,
                  ),
                ])),
          ),
        ),
      ),
      Container(
          height: 75,
          width: 150,
          margin: const EdgeInsets.only(left: 16),
          alignment: Alignment.center,
          foregroundDecoration: BoxDecoration(
            gradient: AppGradients.linear,
            image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image)),
          ))
    ]);

    Widget _renderWidget() {
      if(image != "-") {
        return textWithImage;
      }
      return defaultText;
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ 
          _renderWidget() 
        ]
      ),
    );
  }
}
