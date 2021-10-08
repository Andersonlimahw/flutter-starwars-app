import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_images.dart';
import 'package:lemonstarwars/favorites/favorites_state.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/models/user_model.dart';

class FavoritesController {
  final stateNotifier = ValueNotifier<FavoritesState>(FavoritesState.loading);
  set state(FavoritesState state) => stateNotifier.value = state;
  FavoritesState get state => stateNotifier.value;
  
  List<MovieModel>? favorites;

  void getFavorites() async {
    print("ProfileController.getFavorites(): Starts");
    state = FavoritesState.loading;    
    final mock = List.generate(3, (index) =>
       MovieModel(
        episode_id: 4, 
        title: "A New Hope", 
        director: "Geroge Luccas", 
        opening_crawl: "...", 
        producer: "Luke skywalker", 
        release_date: "1977-10-27", 
        url: ""
      ),
    );   
    favorites = mock;
    
    // favorites = await repository.listFavorites().then(value => value);
    state = FavoritesState.success;
    print("ProfileController.getFavorites(): Success");
  }
}
