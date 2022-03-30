import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/domain/entities/plant.dart';

part 'plant_event.dart';
part 'plant_state.dart';

class PlantBloc extends Bloc<PlantEvent, PlantState> {
  PlantBloc() : super(PlantInitial()) {}

  @override
  Stream<PlantState> mapEventToState(PlantEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
      // yield PlantInitial();
    } else if (event is PlantFiltered) {
      yield* _mapPlantFilteredToState(event);
    }
  }

  Stream<PlantState> _mapAppStartedToState() async* {}

  Stream<PlantState> _mapPlantFilteredToState(PlantFiltered event) async* {}
}
