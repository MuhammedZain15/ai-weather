// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/data_sources/forecast_data_source.dart'
    as _i514;
import '../../features/home/data/data_sources/home_data_source.dart' as _i779;
import '../../features/home/data/repositories/forecast_repo_impl.dart' as _i369;
import '../../features/home/data/repositories/home_repo_impl.dart' as _i333;
import '../../features/home/domain/repositories/forecast_repo.dart' as _i86;
import '../../features/home/domain/repositories/home_repo.dart' as _i1021;
import '../../features/home/domain/use_cases/forecast_use_case.dart' as _i405;
import '../../features/home/domain/use_cases/home_use_case.dart' as _i933;
import '../../features/home/presentation/manager/forecast_cubit/forecast_cubit.dart'
    as _i992;
import '../../features/home/presentation/manager/home_cubit.dart' as _i629;
import '../api/api_manger.dart' as _i339;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.factory<_i779.HomeDataSource>(
        () => _i779.HomeRemoteDataSource(gh<_i339.ApiManger>()));
    gh.factory<_i514.ForecastDataSource>(
        () => _i514.ForecastRemoteDataSource(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i86.ForecastRepo>(
        () => _i369.ForecastRepoImpl(gh<_i514.ForecastDataSource>()));
    gh.factory<_i405.ForecastUseCase>(
        () => _i405.ForecastUseCase(gh<_i86.ForecastRepo>()));
    gh.factory<_i1021.HomeRepo>(
        () => _i333.HomeRepoImpl(gh<_i779.HomeDataSource>()));
    gh.factory<_i992.ForecastCubit>(() =>
        _i992.ForecastCubit(forecastUseCase: gh<_i405.ForecastUseCase>()));
    gh.factory<_i933.HomeUseCase>(
        () => _i933.HomeUseCase(gh<_i1021.HomeRepo>()));
    gh.factory<_i629.HomeCubit>(
        () => _i629.HomeCubit(homeUseCase: gh<_i933.HomeUseCase>()));
    return this;
  }
}
