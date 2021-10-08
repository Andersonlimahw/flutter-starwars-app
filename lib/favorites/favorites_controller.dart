import 'package:flutter/material.dart';
import 'package:lemonstarwars/favorites/favorites_state.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/repository/favorites/favorite_repository.dart';

class FavoritesController {
  final stateNotifier = ValueNotifier<FavoritesState>(FavoritesState.loading);
  set state(FavoritesState state) => stateNotifier.value = state;
  FavoritesState get state => stateNotifier.value;
  
  List<MovieModel>? favorites;
  final repository = FavoriteRepository();

  void getFavorites() async {
    print("ProfileController.getFavorites(): Starts");
    state = FavoritesState.loading;        
    favorites = await repository.listFavorites().then((value) => value);
    state = FavoritesState.success;
    print("ProfileController.getFavorites(): Success");
  }
}
