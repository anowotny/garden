import 'package:dartz/dartz.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:garden/app/domain/entities/plant_type.dart';
import 'package:garden/core/error/failures.dart';

abstract class IPlantRepository {
  //Plant
  Future<Either<Failure, Plant>> getPlantByName(String plantName);
  Future<Either<Failure, List<Plant>>> getAllPlants();
  Future<Either<Failure, int>> addPlant(Plant plant);
  Future<Either<Failure, int>> updatePlant(Plant plant);
//PlantTypes
  Future<Either<Failure, List<PlantType>>> getAllPlantTypes();
  Future<Either<Failure, PlantType>> getPlantTypeById(int id);
  Future<Either<Failure, int>> addPlantType(PlantType plantType);
  Future<Either<Failure, int>> deletePlantType(PlantType plantType);
}
