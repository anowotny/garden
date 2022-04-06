import 'package:floor/floor.dart';

import '../../../domain/entities/plant_type.dart';

@dao
abstract class PlantTypeDao {
  @Query('SELECT * FROM PlantType')
  Future<List<PlantType>> getAllPlantTypes();

  @Query('SELECT * FROM Plant WHERE id= :id')
  Future<PlantType> getPlantType(int id);

  @insert
  Future<int> insertPlantType(PlantType plantType);

  @delete
  Future<int> deletePlantType(PlantType plantType);
}
