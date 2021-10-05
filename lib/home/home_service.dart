import 'package:lemonstarwars/shared/enums/e_request_type.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/services/base_service.dart';

class HomeService {
  // Future<List<MovieModel>> getMovies() async {
  Future<bool> getMovies() async {
    print("HomeService:getMovies(), Loading");
    final url = "films";
    final service = await BaseService(url: url, method: ERquestType.Get);
    final response = await service.get();
    // final movies = List.filled(1, MovieModel); // TODO mapper json
    print("HomeService:getMovies(), Success, response ${response.statusCode}");
    return response.statusCode == 200;
  }  
}