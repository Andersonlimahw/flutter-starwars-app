import 'package:flutter/material.dart';
import 'package:lemonstarwars/detail/detail_state.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/repository/favorites/favorite_repository.dart';

class DetailController {
  final stateNotifier = ValueNotifier<DetailState>(DetailState.empty);
  set state(DetailState state) => stateNotifier.value = state;
  DetailState get state => stateNotifier.value;

  final repository = FavoriteRepository();
  bool isFavorite = false;

  void returIsFavorite({required int id}) async {
    print("DetailController.returIsFavorite(): Starts");
    state = DetailState.loading;    
    //repository.clearTable(tableName: 'favorites');
    isFavorite = await repository.getFavorites(id: id).then((value) => value);     
    state = DetailState.success;  
    print("DetailController.returIsFavorite(): Success, Movie Id $id isFavorite? $isFavorite");
  }
  void toggleFavorite({required MovieModel movie}) async {
    state = DetailState.loading;      
    print("DetailController.toggleFavorite(): Starts, movie id:  ${movie.episode_id}"); 
    if(!isFavorite) {
      await repository.insertFavoriteMovie(movie: movie);    
      print("DetailController.toggleFavorite(): insertFavoriteMovie, movie id:  ${movie.episode_id}"); 
    } else {
      await repository.delete(tableName: 'favorites', id: movie.episode_id);
      print("DetailController.toggleFavorite(): delete, movie id:  ${movie.episode_id}"); 
    }       
    state = DetailState.success;  
    print("DetailController.toggleFavorite(): Success");
  }
}