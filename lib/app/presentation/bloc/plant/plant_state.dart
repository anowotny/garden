part of 'plant_bloc.dart';

abstract class PlantState extends Equatable {
  const PlantState();

  @override
  List<Object> get props => [];
}

class PlantInitial extends PlantState {}

class PlantLoading extends PlantState {}

class PlantLoadSuccess extends PlantState {
  final List<Plant> allPlants;
  final List<Plant> filteredPlants;
  final List<PlantType> plantTypes;

  PlantLoadSuccess({
    this.allPlants,
    this.filteredPlants,
    this.plantTypes,
  });
  @override
  List<Object> get props => [allPlants, filteredPlants, plantTypes];
}

class PlantLoadFailure extends PlantState {
  final String error;

  PlantLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}

class PlantAddedSuccessfully extends PlantState {
  final String plantName;

  PlantAddedSuccessfully(this.plantName);
  @override
  List<Object> get props => [plantName];
}
