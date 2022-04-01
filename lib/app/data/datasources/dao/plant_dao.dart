import 'package:floor/floor.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:injectable/injectable.dart';

@dao
// @LazySingleton(as:PlantDao)
abstract class PlantDao {
  @Query('SELECT * FROM Plant')
  Future<List<Plant>> getAllPlants();

  @Query('SELECT * FROM Plant WHERE name= :name')
  Future<Plant> getPlant(String name);

  @insert
  Future<int> insertPlant(Plant plant);

  @update
  Future<int> updatePlant(Plant plant);
}
