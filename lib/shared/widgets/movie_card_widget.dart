import 'package:flutter/material.dart';

import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';
import 'package:lemonstarwars/shared/widgets/button_widget.dart';

class MovieCardWidget extends StatelessWidget {
  final String url;
  final String image;
  final String title;
  final String releaseDate;
  final VoidCallback onTap;
  
  const MovieCardWidget({
    Key? key,
    required this.url,
    required this.image,
    required this.title,
    required this.releaseDate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(image)),
            ),
          ),              
          SizedBox(
            height: 16,
          ),
          ButtonWidget.primary(label: "Ver mais", onTap: onTap),
          SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: AppTextStyles.body,
          )
        ],
      ),
    );
  }
}
