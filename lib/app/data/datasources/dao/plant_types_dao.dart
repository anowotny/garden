import 'package:floor/floor.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:garden/app/domain/entities/plant_type.dart';
import 'package:injectable/injectable.dart';

// @lazySingleton
@dao
abstract class PlantTypeDao {
  @Query('SELECT * FROM PlantType')
  Future<List<PlantType>> getAllPlantTypes();

  @Query('SELECT * FROM Plant WHERE id= :id')
  Future<PlantType> getPlantType(String id);

  @insert
  Future<int> insertPlantType(PlantType plantType);

  @delete
  Future<int> deletePlantType(PlantType plantType);
}
