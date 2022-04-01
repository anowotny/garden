import 'package:floor/floor.dart';
import 'package:garden/app/data/datasources/dao/plant_dao.dart';
import 'package:garden/app/data/datasources/dao/plant_types_dao.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:garden/app/domain/entities/plant_type.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'database.g.dart';

@Database(version:1, entities: [Plant, PlantType])
abstract class AppDatabase extends FloorDatabase{
  PlantDao get plantDao;
  PlantTypeDao get plantTypeDao;
}

// class FloorDatabaseService{
//   static
// }