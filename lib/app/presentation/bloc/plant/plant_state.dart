part of 'plant_bloc.dart';

abstract class PlantState extends Equatable {
  const PlantState();

  @override
  List<Object> get props => [];
}

class PlantInitial extends PlantState {}

class PlantLoading extends PlantState {}

class PlantLoadSuccess extends PlantState {
  final List<PlantModel> allPlants;
  final List<PlantModel> filteredPlants;

  PlantLoadSuccess({this.allPlants, this.filteredPlants});
  @override
  List<Object> get props => [allPlants, filteredPlants];
}

class PlantLoadFailure extends PlantState {
  final String error;

  PlantLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
