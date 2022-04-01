import 'package:dartz/dartz.dart';
import 'package:garden/app/domain/entities/plant_type.dart';
import 'package:garden/core/error/failures.dart';

abstract class IPlantTypeRepository {
  Future<Either<Failure, List<PlantType>>> getAllPlantTypes();
  Future<Either<Failure, PlantType>> getPlantTypeById(String id);
  Future<Either<Failure, void>> addPlantType(PlantType plantType);
  Future<Either<Failure, void>> deletePlantType(PlantType plantType);
}
