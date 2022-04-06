import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:floor/floor.dart';
import 'package:garden/app/data/datasources/dao/plant_dao.dart';
import 'package:garden/app/data/datasources/database.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@module
abstract class RegisterModule {
  @lazySingleton
  DataConnectionChecker get connectionChecker => DataConnectionChecker();

  @preResolve
  Future<AppDatabase> get database =>
      $FloorAppDatabase.databaseBuilder('my_database.db').build();
}
