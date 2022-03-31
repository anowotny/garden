import 'package:floor/floor.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/domain/entities/plant.dart';

@dao
abstract class PlantDao {
  @Query('SELECT * FROM Plant')
  Future<List<Plant>> getAllPlants();

  @Query('SELECT * FROM Plant WHERE name= :name')
  Future<Plant> getPlant(String name);

  @insert
  Future<void> insertPlant(Plant plant);

  @update
  Future<void> updatePlant(Plant plant);
}
