import 'package:flutter/material.dart';

import 'package:lemonstarwars/core/app_colors.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/widgets/list_item_widget.dart';

class MovieDetailWidget extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

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
              description: movie.title,
            ),                       
            ListItemWidget(
              title: "Director",
              description: movie.director,
            ),
            ListItemWidget(
              title: "Producers",
              description: movie.producer,
            ),
            ListItemWidget(
              title: "Release Date",
              description: movie.release_date,
            ),  
            ListItemWidget(
              title: "Opening description",
              description: movie.opening_crawl,
            ),       
            SizedBox(
              height: 24,
            ),
          ],
        ));
  }
}
