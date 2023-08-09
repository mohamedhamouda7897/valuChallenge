// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/api/api_service.dart' as _i6;
import '../../core/network/network_info.dart' as _i5;
import '../../features/home/data/datasources/home_data_sources.dart' as _i12;
import '../../features/home/data/datasources/home_remote_dto.dart' as _i13;
import '../../features/home/data/repositories/home_data_repo.dart' as _i15;
import '../../features/home/domain/repositories/home_domain_repo.dart' as _i14;
import '../../features/home/domain/usecases/get_all_products_use_case.dart'
as _i30;



import 'injection_container.dart' as _i32;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i5.NetworkInfo>(
        () => _i5.NetworkInfoImpl(gh<_i3.Connectivity>()));
    gh.lazySingleton<_i6.ApiService>(() => _i6.ApiService(gh<_i4.Dio>()));

    gh.lazySingleton<_i12.HomeDataSources>(
        () => _i13.HomeRemoteDto(apiService: gh<_i6.ApiService>()));
    gh.lazySingleton<_i14.HomeDomainRepo>(
        () => _i15.HomeDataRepo(homeDataSources: gh<_i12.HomeDataSources>()));
    gh.lazySingleton<_i30.GetAllProductsUseCase>(() =>_i30.GetAllProductsUseCase(homeDomainRepo: gh<_i14.HomeDomainRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i32.RegisterModule {}
