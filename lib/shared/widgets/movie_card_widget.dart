import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8, 
                              vertical: 8,
                            ),
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(image)),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            title,
                            style: AppTextStyles.bodyBoldSecondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
