import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/repository/base_repository.dart';

class FavoriteRepository extends BaseRepository {    
  FavoriteRepository()
      : super(
          dbName: 'lemon_star_wars_movies_database',
          defaultTableSql: MovieModel.generateCreateTable(name: 'favorites'),
        );

  Future<List<MovieModel>?> listFavorites() async {    
    final maps = await this.ListByTable(tableName: 'favorites');    
    print("listFavorites => maps =>  $maps");
    final list = List.generate(maps.length, (i) {
      return MovieModel(
        id: maps[i]['id'],
        episode_id: maps[i]['episode_id'],
        title: maps[i]['title'],
        director: maps[i]['director'],
        opening_crawl: maps[i]['opening_crawl'],
        producer: maps[i]['producer'],
        release_date: maps[i]['release_date'],
        url: maps[i]['url'],
      );
    });
    if(maps.length > 0) {
      
      list.sort((a, b) => a.episode_id.compareTo(b.episode_id));
      print("Favorites movies : ${list.map((e) => {e.title, e.id })}");
      return list;
    }
    return null;
  }

  Future<bool> getFavorites({required int id}) async {    
    final maps = await this.ListByTable(tableName: 'favorites');    
    print("getFavorites => maps =>  $maps");
    final list = List.generate(maps.length, (i) {
      return MovieModel(
        id: maps[i]['id'],
        episode_id: maps[i]['episode_id'],
        title: maps[i]['title'],
        director: maps[i]['director'],
        opening_crawl: maps[i]['opening_crawl'],
        producer: maps[i]['producer'],
        release_date: maps[i]['release_date'],
        url: maps[i]['url'],
      );
    });
    if(maps.length > 0) {
      print("Favorites movies : ${list.map((e) => {e.title, e.id })}");
      return list.any((element) => element.episode_id == id);
    }
    return false;
  }
  
  Future<int> insertFavoriteMovie({required MovieModel movie}) async {
    print("DetailRepository.insertFavoriteMovie(movie: ${movie.toString()}), tableName: favorites ");
    return await this.insert(
      tableName: 'favorites',
      mapedModel: movie.toMap(),
    );
  }
}
