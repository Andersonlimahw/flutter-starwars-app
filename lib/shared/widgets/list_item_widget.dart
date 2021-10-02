import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';

class ListItemWidget extends StatelessWidget {
  final String title;
  final String description;

  const ListItemWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
    );
  }
}
