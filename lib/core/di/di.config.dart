// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;
import 'package:spending/core/di/register_module.dart' as _i16;
import 'package:spending/core/services/auth_service.dart' as _i8;
import 'package:spending/core/services/auth_service_impl.dart' as _i9;
import 'package:spending/core/services/connection_service.dart' as _i10;
import 'package:spending/core/services/connection_status_impl.dart' as _i11;
import 'package:spending/core/theme/custom_theme.dart' as _i4;
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart'
    as _i15;
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart' as _i12;
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart'
    as _i13;
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart'
    as _i14;

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
    gh.lazySingleton<_i4.CustomTheme>(() => _i4.CustomTheme());
    gh.lazySingleton<_i5.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i6.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i7.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i8.AuthService>(
      () => _i9.AuthServiceImpl(
        gh<_i7.Logger>(),
        gh<_i6.GoogleSignIn>(),
        gh<_i5.FirebaseAuth>(),
      ),
      instanceName: 'AuthServiceImpl',
    );
    gh.lazySingleton<_i10.ConnectionService>(
      () => _i11.ConnectionServiceImpl(
        gh<_i3.Connectivity>(),
        gh<_i7.Logger>(),
      ),
      instanceName: 'ConnectionServiceImpl',
    );
    gh.lazySingleton<_i12.HomeBloc>(() =>
        _i12.HomeBloc(gh<_i8.AuthService>(instanceName: 'AuthServiceImpl')));
    gh.lazySingleton<_i13.LoginBloc>(() => _i13.LoginBloc(
          gh<_i8.AuthService>(instanceName: 'AuthServiceImpl'),
          gh<_i7.Logger>(),
        ));
    gh.lazySingleton<_i14.SplashBloc>(() => _i14.SplashBloc(
          gh<_i8.AuthService>(instanceName: 'AuthServiceImpl'),
          gh<_i10.ConnectionService>(instanceName: 'ConnectionServiceImpl'),
        ));
    gh.lazySingleton<_i15.ConnectionBloc>(() => _i15.ConnectionBloc(
        gh<_i10.ConnectionService>(instanceName: 'ConnectionServiceImpl')));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}
