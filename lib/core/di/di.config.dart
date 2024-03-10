// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i9;
import 'package:spending/core/di/register_module.dart' as _i29;
import 'package:spending/core/services/auth_service.dart' as _i13;
import 'package:spending/core/services/auth_service_impl.dart' as _i14;
import 'package:spending/core/services/connection_service.dart' as _i15;
import 'package:spending/core/services/connection_status_impl.dart' as _i16;
import 'package:spending/core/services/notification_service.dart' as _i10;
import 'package:spending/core/services/notification_service_impl.dart' as _i11;
import 'package:spending/core/theme/custom_theme.dart' as _i4;
import 'package:spending/data/mapper/user_mapper.dart' as _i12;
import 'package:spending/data/repositories/user_repository_impl.dart' as _i22;
import 'package:spending/data/sources/local/floor/database_floor.dart' as _i5;
import 'package:spending/data/sources/local/user_local_data_source.dart'
    as _i17;
import 'package:spending/data/sources/local/user_local_data_source_impl.dart'
    as _i18;
import 'package:spending/data/sources/remote/user_remote_data_source.dart'
    as _i19;
import 'package:spending/data/sources/remote/user_remote_data_source_impl.dart'
    as _i20;
import 'package:spending/domain/repositories/user_repository.dart' as _i21;
import 'package:spending/domain/usecases/user_interactor.dart' as _i24;
import 'package:spending/domain/usecases/user_usecase.dart' as _i23;
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart'
    as _i25;
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart' as _i26;
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart'
    as _i27;
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart'
    as _i28;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i4.CustomTheme>(() => _i4.CustomTheme());
    await gh.factoryAsync<_i5.DatabaseFloor>(
      () => registerModule.databaseFloor,
      preResolve: true,
    );
    gh.lazySingleton<_i6.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i7.FlutterLocalNotificationsPlugin>(
        () => registerModule.flutterNotificationsPlugin);
    gh.lazySingleton<_i8.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i9.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i10.NotificationService>(
        () => _i11.NotificationServiceImpl(
              gh<_i7.FlutterLocalNotificationsPlugin>(),
              gh<_i9.Logger>(),
            ));
    gh.lazySingleton<_i12.UserMapper>(() => _i12.UserMapper());
    gh.lazySingleton<_i13.AuthService>(() => _i14.AuthServiceImpl(
          gh<_i9.Logger>(),
          gh<_i8.GoogleSignIn>(),
          gh<_i6.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i15.ConnectionService>(() => _i16.ConnectionServiceImpl(
          gh<_i3.Connectivity>(),
          gh<_i9.Logger>(),
        ));
    gh.lazySingleton<_i17.UserLocalDataSource>(
        () => _i18.UserLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i12.UserMapper>(),
            ));
    gh.lazySingleton<_i19.UserRemoteDataSource>(
        () => _i20.UserRemoteDataSourceImpl(gh<_i13.AuthService>()));
    gh.lazySingleton<_i21.UserRepository>(() => _i22.UserRepositoryImpl(
          gh<_i17.UserLocalDataSource>(),
          gh<_i19.UserRemoteDataSource>(),
        ));
    gh.lazySingleton<_i23.UserUseCase>(
        () => _i24.UserInteractor(gh<_i21.UserRepository>()));
    gh.lazySingleton<_i25.ConnectionBloc>(
        () => _i25.ConnectionBloc(gh<_i15.ConnectionService>()));
    gh.lazySingleton<_i26.HomeBloc>(
        () => _i26.HomeBloc(gh<_i23.UserUseCase>()));
    gh.lazySingleton<_i27.LoginBloc>(() => _i27.LoginBloc(
          gh<_i23.UserUseCase>(),
          gh<_i9.Logger>(),
        ));
    gh.lazySingleton<_i28.SplashBloc>(
        () => _i28.SplashBloc(gh<_i23.UserUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i29.RegisterModule {}
