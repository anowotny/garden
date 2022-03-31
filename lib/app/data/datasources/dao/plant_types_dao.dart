import 'package:floor/floor.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:garden/app/domain/entities/plant_type.dart';

@dao
abstract class PlantTypeDao {
  @Query('SELECT * FROM PlantType')
  Future<List<PlantType>> getAllPlantTypes();

  @Query('SELECT * FROM Plant WHERE id= :id')
  Future<PlantType> getPlantType(String id);

  @insert
  Future<void> insertPlantType(PlantType plantType);

  @delete
  Future<void> deletePlantType(PlantType plantType);
}
