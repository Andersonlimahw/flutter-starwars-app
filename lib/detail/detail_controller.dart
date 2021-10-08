import 'package:flutter/material.dart';
import 'package:lemonstarwars/detail/detail_repository.dart';
import 'package:lemonstarwars/detail/detail_state.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';

class DetailController {
  final stateNotifier = ValueNotifier<DetailState>(DetailState.empty);
  set state(DetailState state) => stateNotifier.value = state;
  DetailState get state => stateNotifier.value;

  final repository = DetailRepository();
  bool isFavorite = false;

  Future<void> returIsFavorite({required int id}) async {
    print("DetailController.returIsFavorite(): Starts");
    state = DetailState.loading;    
    final movie = await repository.getFavorites(id: id).then((value) => value); 
    isFavorite = movie != null; 
    state = DetailState.success;  
    print("DetailController.returIsFavorite(): Success, Movie Id $id isFavorite? $isFavorite");
  }
  void addMovieToFavorites({required MovieModel movie}) async {
    state = DetailState.loading;      
    print("DetailController.addMovieToFavorites(): Starts");    
    await repository.insertFavoriteMovie(movie: movie);    
    state = DetailState.success;  
    print("DetailController.addMovieToFavorites(): Success");
  }
}