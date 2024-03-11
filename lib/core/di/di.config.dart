// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i10;
import 'package:spending/core/di/register_module.dart' as _i40;
import 'package:spending/core/services/auth_service.dart' as _i17;
import 'package:spending/core/services/auth_service_impl.dart' as _i18;
import 'package:spending/core/services/connection_service.dart' as _i19;
import 'package:spending/core/services/connection_status_impl.dart' as _i20;
import 'package:spending/core/services/notification_service.dart' as _i11;
import 'package:spending/core/services/notification_service_impl.dart' as _i12;
import 'package:spending/core/theme/custom_theme.dart' as _i4;
import 'package:spending/data/mapper/spending_mapper.dart' as _i13;
import 'package:spending/data/mapper/user_mapper.dart' as _i16;
import 'package:spending/data/repositories/spending_repository_impl.dart'
    as _i34;
import 'package:spending/data/repositories/user_repository_impl.dart' as _i28;
import 'package:spending/data/sources/local/floor/database_floor.dart' as _i5;
import 'package:spending/data/sources/local/spending_local_data_source.dart'
    as _i21;
import 'package:spending/data/sources/local/spending_local_data_source_impl.dart'
    as _i22;
import 'package:spending/data/sources/local/user_local_data_source.dart'
    as _i23;
import 'package:spending/data/sources/local/user_local_data_source_impl.dart'
    as _i24;
import 'package:spending/data/sources/remote/spending_remote_data_source.dart'
    as _i14;
import 'package:spending/data/sources/remote/spending_remote_data_source_impl.dart'
    as _i15;
import 'package:spending/data/sources/remote/user_remote_data_source.dart'
    as _i25;
import 'package:spending/data/sources/remote/user_remote_data_source_impl.dart'
    as _i26;
import 'package:spending/domain/repositories/spending_repository.dart' as _i33;
import 'package:spending/domain/repositories/user_repository.dart' as _i27;
import 'package:spending/domain/usecases/spending_interactor.dart' as _i36;
import 'package:spending/domain/usecases/spending_usecase.dart' as _i35;
import 'package:spending/domain/usecases/user_interactor.dart' as _i30;
import 'package:spending/domain/usecases/user_usecase.dart' as _i29;
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart'
    as _i31;
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart' as _i39;
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart'
    as _i32;
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart'
    as _i37;
import 'package:spending/presentation/screens/sync/bloc/sync_bloc.dart' as _i38;

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
    gh.lazySingleton<_i7.FirebaseFirestore>(
        () => registerModule.firebaseFirestore);
    gh.lazySingleton<_i8.FlutterLocalNotificationsPlugin>(
        () => registerModule.flutterNotificationsPlugin);
    gh.lazySingleton<_i9.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i10.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i11.NotificationService>(
        () => _i12.NotificationServiceImpl(
              gh<_i8.FlutterLocalNotificationsPlugin>(),
              gh<_i10.Logger>(),
            ));
    gh.lazySingleton<_i13.SpendingMapper>(() => _i13.SpendingMapper());
    gh.lazySingleton<_i14.SpendingRemoteDataSource>(
        () => _i15.SpendingRemoteDataSourceImpl(
              gh<_i7.FirebaseFirestore>(),
              gh<_i10.Logger>(),
            ));
    gh.lazySingleton<_i16.UserMapper>(() => _i16.UserMapper());
    gh.lazySingleton<_i17.AuthService>(() => _i18.AuthServiceImpl(
          gh<_i10.Logger>(),
          gh<_i9.GoogleSignIn>(),
          gh<_i6.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i19.ConnectionService>(() => _i20.ConnectionServiceImpl(
          gh<_i3.Connectivity>(),
          gh<_i10.Logger>(),
        ));
    gh.lazySingleton<_i21.SpendingLocalDataSource>(
        () => _i22.SpendingLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i13.SpendingMapper>(),
            ));
    gh.lazySingleton<_i23.UserLocalDataSource>(
        () => _i24.UserLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i16.UserMapper>(),
            ));
    gh.lazySingleton<_i25.UserRemoteDataSource>(
        () => _i26.UserRemoteDataSourceImpl(gh<_i17.AuthService>()));
    gh.lazySingleton<_i27.UserRepository>(() => _i28.UserRepositoryImpl(
          gh<_i23.UserLocalDataSource>(),
          gh<_i25.UserRemoteDataSource>(),
          gh<_i21.SpendingLocalDataSource>(),
        ));
    gh.lazySingleton<_i29.UserUseCase>(
        () => _i30.UserInteractor(gh<_i27.UserRepository>()));
    gh.lazySingleton<_i31.ConnectionBloc>(
        () => _i31.ConnectionBloc(gh<_i19.ConnectionService>()));
    gh.lazySingleton<_i32.LoginBloc>(() => _i32.LoginBloc(
          gh<_i29.UserUseCase>(),
          gh<_i10.Logger>(),
        ));
    gh.lazySingleton<_i33.SpendingRepository>(() => _i34.SpendingRepositoryImpl(
          gh<_i14.SpendingRemoteDataSource>(),
          gh<_i21.SpendingLocalDataSource>(),
          gh<_i23.UserLocalDataSource>(),
        ));
    gh.lazySingleton<_i35.SpendingUseCase>(
        () => _i36.SpendingInteractor(gh<_i33.SpendingRepository>()));
    gh.lazySingleton<_i37.SplashBloc>(
        () => _i37.SplashBloc(gh<_i29.UserUseCase>()));
    gh.lazySingleton<_i38.SyncBloc>(
        () => _i38.SyncBloc(gh<_i35.SpendingUseCase>()));
    gh.lazySingleton<_i39.HomeBloc>(() => _i39.HomeBloc(
          gh<_i29.UserUseCase>(),
          gh<_i35.SpendingUseCase>(),
          gh<_i10.Logger>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i40.RegisterModule {}
