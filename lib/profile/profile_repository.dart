import 'package:lemonstarwars/shared/models/user_model.dart';
import 'package:lemonstarwars/shared/repository/base_repository.dart';

class ProfileRepository  extends BaseRepository { 

  ProfileRepository() : 
    super(dbName: 'lemon_star_wars_database',  defaultTableSql: UserModel.generateCreateTable()); 
  
  Future<UserModel?> getUser() async {
    final maps = await this.ListByTable(tableName: 'user');
    final list =  List.generate(maps.length, (i) {
      return UserModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'], 
        image: maps[i]['image'],
        nickName: maps[i]['nickName']
      );
    });
    maps.length > 0 ? list.first : null;
  }

  Future<int> insertUser({ required UserModel user }) async {
    return await this.insert(
      tableName: 'user',
      mapedModel: user.toMap()
    );
  }
}
