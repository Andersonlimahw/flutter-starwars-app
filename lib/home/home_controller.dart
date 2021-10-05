import 'package:flutter/material.dart';
import 'package:lemonstarwars/home/home_service.dart';
import 'package:lemonstarwars/home/home_state.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;
  
  List<MovieModel>? movies;
  final service = HomeService();

  void getMovies() async {
    print("HomeController:getMovies(), Loading");
    state = HomeState.loading;
    await service.getMovies()
    .then((result) => {
      movies = result
    });
    print("HomeController:getMovies(), Success");
    state = HomeState.success;
  }
}