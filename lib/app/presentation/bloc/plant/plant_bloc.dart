import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/map_failures.dart';
import '../../../../core/util/mock_json.dart';
import '../../../domain/entities/plant.dart';
import '../../../domain/entities/plant_type.dart';
import '../../../domain/irepositories/iplant_repository.dart';

part 'plant_event.dart';
part 'plant_state.dart';

@injectable
class PlantBloc extends Bloc<PlantEvent, PlantState> {
  final IPlantRepository _plantRepository;
  PlantBloc(this._plantRepository) : super(PlantInitial());
  List<Plant> _allPlants = [];
  List<Plant> _allPlantsFetched = [];
  List<PlantType> _allPlantTypes = [];

  @override
  Stream<PlantState> mapEventToState(PlantEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
      // yield PlantInitial();
    }
    if (event is PlantFiltered) {
      yield* _mapPlantFilteredToState(event);
    }
    if (event is SaveNewPlantPressed) {
      yield* _mapSavePlantToState(event);
    }
    if (event is SaveUpdatedPlantPressed) {
      yield* _mapUpdatePlantToState(event);
    }
  }

  Stream<PlantState> _mapAppStartedToState() async* {
    yield PlantLoading();
    final allPlants = await _plantRepository.getAllPlants();
    yield* allPlants.fold((failure) async* {
      yield PlantLoadFailure(mapFailureToMessage(failure));
    }, (plantList) async* {
      this._allPlants = plantList;
      this._allPlantsFetched = plantList;
      if (this._allPlants.isNotEmpty) {
        this._allPlants.sort((a, b) => a.name.compareTo(b.name));
      }
      final plantTypesResult = await _plantRepository.getAllPlantTypes();
      yield* plantTypesResult.fold((failure) async* {
        PlantLoadFailure(mapFailureToMessage(failure));
      }, (plantTypeList) async* {
        if (plantTypeList.isEmpty) {
          for (int i = 0; i < mockPlantTypes.length; i++) {
            final type = PlantType.fromJson(mockPlantTypes[i]);
            final response = await _plantRepository.addPlantType(type);
            yield* response.fold((failure) async* {
            }, (id) async* {
              print(id);
            });
          }
          yield PlantLoadSuccess(
              allPlants: this._allPlants,
              filteredPlants: this._allPlants,
              plantTypes: this._allPlantTypes);
        } else {
          this._allPlantTypes = plantTypeList;
          this._allPlantTypes.sort((a, b) => a.name.compareTo(b.name));
          yield PlantLoadSuccess(
              allPlants: this._allPlants,
              filteredPlants: this._allPlants,
              plantTypes: this._allPlantTypes);
        }
      });
    });
  }

  Stream<PlantState> _mapSavePlantToState(SaveNewPlantPressed event) async* {
    yield PlantLoading();
    final result = await _plantRepository.addPlant(event.newPlant);
    yield* result.fold((failure) async* {
      PlantLoadFailure(mapFailureToMessage(failure));
    }, (plantId) async* {
      yield PlantAddedSuccessfully(event.newPlant.name);

      final refresh = await _plantRepository.getAllPlants();
      yield* refresh.fold((failure) async* {
        yield PlantLoadFailure(mapFailureToMessage(failure));
      }, (plantList) async* {
        this._allPlants = plantList;
        if (this._allPlants.isNotEmpty) {
          this._allPlants.sort((a, b) => a.name.compareTo(b.name));
        }
        this._allPlantsFetched = plantList;

        yield PlantLoadSuccess(
            allPlants: this._allPlants,
            filteredPlants: this._allPlants,
            plantTypes: this._allPlantTypes);
      });
    });
  }

  Stream<PlantState> _mapUpdatePlantToState(
      SaveUpdatedPlantPressed event) async* {
    yield PlantLoading();
    final result = await _plantRepository.updatePlant(event.newPlant);
    yield* result.fold((failure) async* {
      PlantLoadFailure(mapFailureToMessage(failure));
    }, (plantId) async* {
      yield PlantAddedSuccessfully(event.newPlant.name);

      final refresh = await _plantRepository.getAllPlants();
      yield* refresh.fold((failure) async* {
        yield PlantLoadFailure(mapFailureToMessage(failure));
      }, (plantList) async* {
        this._allPlants = plantList;
        if (this._allPlants.isNotEmpty) {
          this._allPlants.sort((a, b) => a.name.compareTo(b.name));
        }
        this._allPlantsFetched = plantList;
        yield PlantLoadSuccess(
            allPlants: this._allPlants,
            filteredPlants: this._allPlants,
            plantTypes: this._allPlantTypes);
      });
      print(plantId);
      // yield PlantInitial();
    });
  }

  Stream<PlantState> _mapPlantFilteredToState(PlantFiltered event) async* {
    this._allPlants = this._allPlantsFetched;
    if (event.filter != null) {
      final filteredPlants = this
          ._allPlants
          .where((element) =>
              element.name.toLowerCase().contains(event.filter.toLowerCase()))
          .toList();
      yield PlantLoadSuccess(
          allPlants: filteredPlants,
          filteredPlants: filteredPlants,
          plantTypes: this._allPlantTypes);
    } else {
      yield PlantLoadSuccess(
          allPlants: this._allPlantsFetched,
          filteredPlants: this._allPlantsFetched,
          plantTypes: this._allPlantTypes);
    }
  }
}
