import 'package:flutter/material.dart';
import 'package:lemonstarwars/home/home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  void getMovies() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    state = HomeState.success;
  }
}