part of 'plant_bloc.dart';

abstract class PlantEvent extends Equatable {
  const PlantEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends PlantEvent {}

class PlantFiltered extends PlantEvent {
  final String filter;

  PlantFiltered(this.filter);
  @override
  List<Object> get props => [filter];
}

// class AddPlantPressed extends PlantEvent{}

class SavePlantPressed extends PlantEvent {
  final Plant newPlant;

  SavePlantPressed(this.newPlant);

  @override
  List<Object> get props => [newPlant];
}
