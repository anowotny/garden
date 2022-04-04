// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/data/datasources/database.dart' as _i3;
import '../../app/data/repositories/plant_repository.dart' as _i6;
import '../../app/domain/irepositories/iplant_repository.dart' as _i5;
import '../../app/presentation/bloc/plant/plant_bloc.dart' as _i7;
import 'register_module.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.AppDatabase>(() => registerModule.database,
      preResolve: true);
  gh.lazySingleton<_i4.DataConnectionChecker>(
      () => registerModule.connectionChecker);
  gh.lazySingleton<_i5.IPlantRepository>(
      () => _i6.PlantRepository(get<_i3.AppDatabase>()));
  gh.factory<_i7.PlantBloc>(() => _i7.PlantBloc(get<_i5.IPlantRepository>()));
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
