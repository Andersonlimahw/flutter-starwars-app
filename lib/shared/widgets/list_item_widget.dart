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
      this.image = ""
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Text.rich(
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
            if(image.isNotEmpty)          
              Container(
                height: 75,
                width: 145,
                margin: const EdgeInsets.only(left: 16),
                alignment: Alignment.bottomRight,
                foregroundDecoration: BoxDecoration(
                  gradient: AppGradients.linear,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(image)),
                )
            ),           
          ]),
        ],
      ),
    );
  }
}
