import 'dart:ui';

import 'package:flutter/material.dart';
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
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: movies
                      .map((e) => Container(
                        width: 240,
                        child: MovieCardWidget(
                            url: "https://swapi.dev/api/films/1",
                            image:
                                "https://m.media-amazon.com/images/I/512HooIJQqL.jpg",
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
