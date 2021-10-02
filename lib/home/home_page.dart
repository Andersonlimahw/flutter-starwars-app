import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';
import 'package:lemonstarwars/shared/widgets/app_bar_widget.dart';
import 'package:lemonstarwars/shared/widgets/movie_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var movies = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: "Star wars",
          subtitle: "Movies",
          image: AppImages.banner,
        ),
        body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: movies
                      .map((e) => Container(
                        width: 240,
                        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                        child: MovieCardWidget(
                            url: "https://swapi.dev/api/films/1",
                            image:
                                "https://upload.wikimedia.org/wikipedia/pt/a/ae/Starwars_06.jpg",
                            title: "A New Hope",
                            releaseDate: "25/05/1977",
                            onTap: () {
                              print("Ver mais");
                            }),
                      ))
                      .toList(),
          ),
        ));
  }
}
