import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_colors.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';
import 'package:lemonstarwars/shared/widgets/list_item_widget.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(        
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Description", 
              style: AppTextStyles.headingSecondary,
            ),
            Divider(
              color: AppColors.dividerColor,
            ), 
            ListItemWidget(
              title: "Oficial Title",
              description: "A New Hope",
            ),           
            ListItemWidget(
              title: "Opening description",
              description: "New hope description",
            ),
            ListItemWidget(
              title: "Diretor",
              description: "New hope description",
            ),
            ListItemWidget(
              title: "Producers",
              description: "New hope description",
            ),
            ListItemWidget(
              title: "Release Date",
              description: "New hope description",
            ),         
            SizedBox(
              height: 8,
            ),
            // TODO: Buttons with actions
            Container(
              height: 60,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Save", 
                    style: AppTextStyles.bodyLightStarWarsSmallSecondary,
                  ),
                  Text(
                    "Like", 
                    style: AppTextStyles.bodyLightStarWarsSmallSecondary,
                  ),
                  Text(
                    "Share", 
                    style: AppTextStyles.bodyLightStarWarsSmallSecondary,
                  ),
                ],
              ),
            ),
             SizedBox(
              height: 24,
            ),
          ],
        ));
  }
}
