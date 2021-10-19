// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/auth_base_model.dart' as _i3;
import '../data/local/pref_data_source.dart' as _i4;
import 'app_module.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AuthBaseModel>(() => appModule.getAuthBaseModel());
  gh.lazySingleton<_i4.PrefDataSource>(() => _i4.PrefDataSource());
  return get;
}

class _$AppModule extends _i5.AppModule {}
