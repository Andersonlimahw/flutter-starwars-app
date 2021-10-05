import 'dart:convert';

import 'package:lemonstarwars/shared/enums/e_request_type.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/services/base_service.dart';

class HomeService {
  Future<List<MovieModel>> getMovies() async {
    print("HomeService:getMovies(), Loading");

    final url = "films";
    final service = await BaseService(url: url, method: ERquestType.Get);
    final response = await service.get();    
    final body = jsonDecode(response.body);    
    final results = body['results'] as List;   
    final movies = results.map((movie) => MovieModel.fromMap(movie)).toList();
    
    print("HomeService:getMovies(), Success, response ${response.statusCode}, Count: ${movies.length} ");
    return movies;
  }  
}