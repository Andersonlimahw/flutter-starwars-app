import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';
import 'package:lemonstarwars/detail/widgets/movie_detail_widget.dart';
import 'package:lemonstarwars/shared/widgets/app_bar_widget.dart';
import 'package:lemonstarwars/shared/widgets/movie_card_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: "A New Hope",
          subtitle: "Episode: 1",
          image: AppImages.newHope,
        ),
        body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          child: ListView(scrollDirection: Axis.vertical, 
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: MovieDetailWidget(),
            )
          ]),
        ));
  }
}
