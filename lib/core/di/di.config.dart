// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;
import 'package:spending/core/di/register_module.dart' as _i12;
import 'package:spending/core/services/auth_service.dart' as _i7;
import 'package:spending/core/services/auth_service_impl.dart' as _i8;
import 'package:spending/core/theme/custom_theme.dart' as _i3;
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart' as _i9;
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart'
    as _i10;
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart'
    as _i11;

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
    gh.lazySingleton<_i4.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i5.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i6.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i7.AuthService>(
      () => _i8.AuthServiceImpl(
        gh<_i6.Logger>(),
        gh<_i5.GoogleSignIn>(),
        gh<_i4.FirebaseAuth>(),
      ),
      instanceName: 'AuthServiceImpl',
    );
    gh.lazySingleton<_i9.HomeBloc>(() =>
        _i9.HomeBloc(gh<_i7.AuthService>(instanceName: 'AuthServiceImpl')));
    gh.lazySingleton<_i10.LoginBloc>(() => _i10.LoginBloc(
          gh<_i7.AuthService>(instanceName: 'AuthServiceImpl'),
          gh<_i6.Logger>(),
        ));
    gh.lazySingleton<_i11.SplashBloc>(() =>
        _i11.SplashBloc(gh<_i7.AuthService>(instanceName: 'AuthServiceImpl')));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
