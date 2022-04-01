import 'dart:io';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'package:garden/app/data/datasources/dao/plant_dao.dart';
import 'package:garden/app/data/datasources/database.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:dartz/dartz.dart';
import 'package:garden/app/domain/irepositories/iplant_repository.dart';
import 'package:garden/core/error/error_messages.dart';
import 'package:garden/core/error/exceptions.dart';
import 'package:garden/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPlantRepository)
class PlantRepository extends IPlantRepository {
   PlantDao plantDao;

  // PlantRepository({@required this.plantDao});

//TODO add data connection checker
  @override
  Future<Either<Failure, int>> addPlant(Plant plant) async {
    try {
      int primaryKey = await plantDao.insertPlant(plant);
      return Right(primaryKey);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on BadRequestException catch (error) {
      return Left(BadRequestFailure(error.message));
    } on UnauthorizedException {
      return Left(UnauthorizedFailure(CREDENTIALS_REJECTED));
    } on SocketException {
      return Left(SocketFailure(SOCKET_FAILURE));
    } on PlatformException catch (e) {
      print('ERROR');
      print(e.toString());
      return Left(PlatformFailure(PLATFORM_FAILURE));
    }
  }

  @override
  Future<Either<Failure, List<Plant>>> getAllPlants() async {
    try {
      final allPlants = await plantDao.getAllPlants();
      if (allPlants == null) {
        throw NotFoundException(message: NOT_FOUND_EXCEPTION);
      } else
        return Right(allPlants);
    } on NoSuchMethodError catch (error) {
      return Left(NoSuchMethodFailure(NOT_FOUND_EXCEPTION));
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on BadRequestException catch (error) {
      return Left(BadRequestFailure(error.message));
    } on UnauthorizedException {
      return Left(UnauthorizedFailure(CREDENTIALS_REJECTED));
    } on SocketException {
      return Left(SocketFailure(SOCKET_FAILURE));
    } on PlatformException catch (e) {
      print('ERROR');
      print(e.toString());
      return Left(PlatformFailure(PLATFORM_FAILURE));
    }
  }

  @override
  Future<Either<Failure, Plant>> getPlantByName(String plantName) async {
    try {
      final result = await plantDao.getPlant(plantName);
      if (result == null) {
        throw NotFoundException();
      } else
        return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on BadRequestException catch (error) {
      return Left(BadRequestFailure(error.message));
    } on UnauthorizedException {
      return Left(UnauthorizedFailure(CREDENTIALS_REJECTED));
    } on SocketException {
      return Left(SocketFailure(SOCKET_FAILURE));
    } on PlatformException catch (e) {
      print('ERROR');
      print(e.toString());
      return Left(PlatformFailure(PLATFORM_FAILURE));
    }
  }

  @override
  Future<Either<Failure, int>> updatePlant(Plant plant) async {
    try {
      final result = await plantDao.updatePlant(plant);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    } on BadRequestException catch (error) {
      return Left(BadRequestFailure(error.message));
    } on UnauthorizedException {
      return Left(UnauthorizedFailure(CREDENTIALS_REJECTED));
    } on SocketException {
      return Left(SocketFailure(SOCKET_FAILURE));
    } on PlatformException catch (e) {
      print('ERROR');
      print(e.toString());
      return Left(PlatformFailure(PLATFORM_FAILURE));
    }
  }
}