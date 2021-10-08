import 'dart:convert';

import 'package:lemonstarwars/shared/enums/e_request_type.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/services/base_service.dart';

class HomeService extends BaseService {
  HomeService() : super(url: 'films', method: ERequestType.Get);
  /**
   * Return a List of Movies
   */
  Future<List<MovieModel>> getMovies() async {
    print("HomeService:getMovies(), Loading");
    // Request:    
    final response = await this.get().then((value) => value);    
    // Translation:
    final body = jsonDecode(response.body);    
    final results = body['results'] as List;   
    final movies = results.map((movie) => MovieModel.fromMap(movie)).toList();
    
    // Order by Epsisode
    movies.sort((a, b) => a.episode_id.compareTo(b.episode_id));    

    // Result
    print("HomeService:getMovies(), Success, response ${response.statusCode}, Count: ${movies.length} ");
    return movies;
  }  
}