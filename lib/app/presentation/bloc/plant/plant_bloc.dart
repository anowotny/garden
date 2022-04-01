import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:garden/app/domain/irepositories/iplant_repository.dart';
import 'package:garden/core/error/map_failures.dart';
import 'package:injectable/injectable.dart';

part 'plant_event.dart';
part 'plant_state.dart';

@injectable
class PlantBloc extends Bloc<PlantEvent, PlantState> {
  final IPlantRepository _plantRepository;
  PlantBloc(this._plantRepository) : super(PlantInitial());
  List<Plant> _allPlants = [];

  @override
  Stream<PlantState> mapEventToState(PlantEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
      // yield PlantInitial();
    } else if (event is PlantFiltered) {
      yield* _mapPlantFilteredToState(event);
    }
  }

  Stream<PlantState> _mapAppStartedToState() async* {
    yield PlantLoading();
    final allPlants = await _plantRepository.getAllPlants();
    yield* allPlants.fold((failure) async* {
      yield PlantLoadFailure(mapFailureToMessage(failure));
    }, (plantList) async* {
      this._allPlants = plantList;
      if (this._allPlants.isNotEmpty) {
        this._allPlants.sort((a, b) => a.name.compareTo(b.name));
      }
      yield PlantLoadSuccess(
          allPlants: this._allPlants, filteredPlants: this._allPlants);
    });
  }

  Stream<PlantState> _mapPlantFilteredToState(PlantFiltered event) async* {}
}
