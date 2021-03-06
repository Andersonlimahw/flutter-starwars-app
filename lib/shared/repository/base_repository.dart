import 'package:flutter/material.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BaseRepository {
  final String dbName;
  final String defaultTableSql;
  
  BaseRepository({
    required this.dbName,
    required this.defaultTableSql,    
  }) : assert(dbName.contains('_database') && dbName.length >= 10 && defaultTableSql.contains('CREATE TABLE')) {
    initDB();
  }

  /**
   * openDataBaseByName, 
   * Open a conecction with sqlite database
   */
  Future<Database> openDataBaseByName() async {    
    print("BaseRepository.openDataBaseByName(): Init, opening Database with name: $dbName.db");
    WidgetsFlutterBinding.ensureInitialized();    
    final database = openDatabase(      
      join(await getDatabasesPath(), '$dbName.db'),
    );
    print("BaseRepository.openDataBaseByName(): Success, Database opened with name: $dbName.db");    
    return database;
  }

  Future<Database> initDB() async {
    print("BaseRepository.initDB(): Init, Creating/opening Database with name: $dbName.db");
    final userTable = UserModel.generateCreateTable();
    final favoriteTable = MovieModel.generateCreateTable(name: 'favorites');

    WidgetsFlutterBinding.ensureInitialized();    
    final database = openDatabase(      
      join(await getDatabasesPath(), '$dbName.db'),
      onCreate: (db, version) async {
               await db.execute(userTable);
               await db.execute(favoriteTable);
      },
      version: 2
    );
    print("BaseRepository.initDB(): Success, Database opened with name: $dbName.db");  
    return database;
  }

  // A method that retrieves all the  from the  table.
  Future<List<Map<String, dynamic>>> ListByTable({required String tableName }) async {
    // Get a reference to the database.
    final db = await openDataBaseByName();

    // Query the table for all The .
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    print("BaseRepository.ListByTable(tableName: $tableName): Success : maps => $maps");
    await db.close();
    return maps;
  }

  // A method that retrieves all the  from the  table.
  Future<List<Map<String, dynamic>>> GetById({ required String tableName, required int id }) async {
    // Get a reference to the database.
    final db = await openDataBaseByName();

    // Query the table for all The .
    final List<Map<String, dynamic>> maps = await db.query(
      tableName, 
      where: 'id = $id', 
      whereArgs: [id]
    );
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    print("BaseRepository.GetById(tableName: $tableName, id: $id ): Success : maps => $maps");
    await db.close();
    return maps;
  }

  /**
   * Insert a register e provided table
   */
  Future<int> insert({ required String tableName, required Map<String, dynamic> mapedModel }) async {
    // Get a reference to the database.
    final db = await openDataBaseByName();
    print("BaseRepository.insert(tableName: $tableName, mapedModel: $mapedModel ): Start : $dbName.db, db: $db");
    final result = await db.insert(
      tableName,
      mapedModel,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("BaseRepository.insert(tableName: $tableName, mapedModel: $mapedModel ): Success : $dbName.db, result: $result");
    await db.close();
    return result;
  }

   /**
   * Insert a register e provided table
   */
  Future<int> update({ required String tableName, required Map<String, dynamic> mapedModel, required int id }) async {
    // Get a reference to the database.
    final db = await openDataBaseByName(); 
    final result = await db.update(
      tableName,
      mapedModel,
      where: 'id = $id', 
      whereArgs: [id]
    );
    print("BaseRepository.update(tableName: $tableName, id: $id, mapedModel: $mapedModel ): Success : $dbName.db, result: $result");
    await db.close();
    return result;
  }

  /**
   * Insert a register e provided table
  */
  Future<int> delete({ required String tableName, required int id }) async {
    // Get a reference to the database.
    final db = await openDataBaseByName();   
    final result = await db.delete(
      tableName,      
      where: 'id = ?', 
      whereArgs: [id]
    );
    print("BaseRepository.delete(tableName: $tableName, id: $id ): Success : $dbName.db, result: $result");
    await db.close();
    return result;
  }
  
   /**
   * Insert a register e provided table
  */
  Future<int> clearTable({ required String tableName }) async {
    // Get a reference to the database.
    final db = await openDataBaseByName();   
    final result = await db.delete(
      tableName,            
    );
    print("BaseRepository.clearTable(tableName: $tableName): Success : $dbName.db, result: $result");
    await db.close();
    return result;
  }

}