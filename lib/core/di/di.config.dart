// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:spending/core/di/register_module.dart' as _i8;
import 'package:spending/core/services/auth_service.dart' as _i5;
import 'package:spending/core/theme/custom_theme.dart' as _i3;
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart'
    as _i6;
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart'
    as _i7;

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
    gh.lazySingleton<_i3.CustomTheme>(() => _i3.CustomTheme());
    gh.lazySingleton<_i4.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i5.AuthService>(() => _i5.AuthService(gh<_i4.Logger>()));
    gh.lazySingleton<_i6.LoginBloc>(() => _i6.LoginBloc(gh<_i5.AuthService>()));
    gh.lazySingleton<_i7.SplashBloc>(
        () => _i7.SplashBloc(gh<_i5.AuthService>()));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
