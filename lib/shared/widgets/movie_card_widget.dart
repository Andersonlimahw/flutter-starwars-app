import 'package:flutter/material.dart';

import 'package:lemonstarwars/core/app_text_styles.dart';

class MovieCardWidget extends StatelessWidget {  
  final String image;
  final String title;  
  final VoidCallback onTap;
  final double? cardHeigth;

  const MovieCardWidget({
    Key? key,    
    required this.image,
    required this.title,    
    required this.onTap,
    this.cardHeigth = 180,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16),
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
                            height: cardHeigth,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.fill,
                                alignment: Alignment.center
                              ),
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
