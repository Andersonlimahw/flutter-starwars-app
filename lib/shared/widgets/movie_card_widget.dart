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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image)),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: AppTextStyles.bodyStarWars,
          ),
          SizedBox(
            height: 8,
          ),
          ButtonWidget.primary(label: "Ver mais", onTap: onTap),
          SizedBox(
            height: 8,
          ),
          Divider()
        ],
      ),
    );
  }
}
