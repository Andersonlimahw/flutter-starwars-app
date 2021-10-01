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
  var movies = [1, 2];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: movies
                      .map((e) => Expanded(
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
              )
            ],
          ),
        ));
  }
}
