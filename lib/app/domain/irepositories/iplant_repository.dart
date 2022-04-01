import 'package:dartz/dartz.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:garden/core/error/failures.dart';

abstract class IPlantRepository {
  Future<Either<Failure, Plant>> getPlantByName(String plantName);
  Future<Either<Failure, List<Plant>>> getAllPlants();
  Future<Either<Failure, int>> addPlant(Plant plant);
  Future<Either<Failure, int>> updatePlant(Plant plant);
}
