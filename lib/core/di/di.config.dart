// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:flutter/material.dart' as _i17;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i11;
import 'package:spending/core/di/register_module.dart' as _i51;
import 'package:spending/core/services/auth_service.dart' as _i19;
import 'package:spending/core/services/auth_service_impl.dart' as _i20;
import 'package:spending/core/services/connection_service.dart' as _i21;
import 'package:spending/core/services/connection_status_impl.dart' as _i22;
import 'package:spending/core/services/notification_service.dart' as _i12;
import 'package:spending/core/services/notification_service_impl.dart' as _i13;
import 'package:spending/core/theme/custom_theme.dart' as _i4;
import 'package:spending/data/mapper/expense_mapper.dart' as _i6;
import 'package:spending/data/mapper/spending_mapper.dart' as _i14;
import 'package:spending/data/mapper/user_mapper.dart' as _i18;
import 'package:spending/data/repositories/expense_repository_impl.dart'
    as _i39;
import 'package:spending/data/repositories/spending_repository_impl.dart'
    as _i44;
import 'package:spending/data/repositories/user_repository_impl.dart' as _i34;
import 'package:spending/data/sources/local/expense_local_data_source.dart'
    as _i23;
import 'package:spending/data/sources/local/expense_local_data_source_impl.dart'
    as _i24;
import 'package:spending/data/sources/local/floor/database_floor.dart' as _i5;
import 'package:spending/data/sources/local/spending_local_data_source.dart'
    as _i27;
import 'package:spending/data/sources/local/spending_local_data_source_impl.dart'
    as _i28;
import 'package:spending/data/sources/local/user_local_data_source.dart'
    as _i29;
import 'package:spending/data/sources/local/user_local_data_source_impl.dart'
    as _i30;
import 'package:spending/data/sources/remote/expense_remote_data_source.dart'
    as _i25;
import 'package:spending/data/sources/remote/expense_remote_data_source_impl.dart'
    as _i26;
import 'package:spending/data/sources/remote/spending_remote_data_source.dart'
    as _i15;
import 'package:spending/data/sources/remote/spending_remote_data_source_impl.dart'
    as _i16;
import 'package:spending/data/sources/remote/user_remote_data_source.dart'
    as _i31;
import 'package:spending/data/sources/remote/user_remote_data_source_impl.dart'
    as _i32;
import 'package:spending/domain/repositories/expense_repository.dart' as _i38;
import 'package:spending/domain/repositories/spending_repository.dart' as _i43;
import 'package:spending/domain/repositories/user_repository.dart' as _i33;
import 'package:spending/domain/usecases/expense_interactor.dart' as _i41;
import 'package:spending/domain/usecases/expense_usecase.dart' as _i40;
import 'package:spending/domain/usecases/spending_interactor.dart' as _i46;
import 'package:spending/domain/usecases/spending_usecase.dart' as _i45;
import 'package:spending/domain/usecases/user_interactor.dart' as _i36;
import 'package:spending/domain/usecases/user_usecase.dart' as _i35;
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart'
    as _i37;
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart' as _i49;
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart'
    as _i42;
import 'package:spending/presentation/screens/spending/bloc/spending_bloc.dart'
    as _i50;
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart'
    as _i47;
import 'package:spending/presentation/screens/sync/bloc/sync_bloc.dart' as _i48;

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
    gh.lazySingleton<_i6.ExpenseMapper>(() => _i6.ExpenseMapper());
    gh.lazySingleton<_i7.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i8.FirebaseFirestore>(
        () => registerModule.firebaseFirestore);
    gh.lazySingleton<_i9.FlutterLocalNotificationsPlugin>(
        () => registerModule.flutterNotificationsPlugin);
    gh.lazySingleton<_i10.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i11.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i12.NotificationService>(
        () => _i13.NotificationServiceImpl(
              gh<_i9.FlutterLocalNotificationsPlugin>(),
              gh<_i11.Logger>(),
            ));
    gh.lazySingleton<_i14.SpendingMapper>(() => _i14.SpendingMapper());
    gh.lazySingleton<_i15.SpendingRemoteDataSource>(
        () => _i16.SpendingRemoteDataSourceImpl(gh<_i8.FirebaseFirestore>()));
    gh.factory<_i17.TextEditingController>(
        () => registerModule.textEditingController);
    gh.lazySingleton<_i18.UserMapper>(() => _i18.UserMapper());
    gh.lazySingleton<_i19.AuthService>(() => _i20.AuthServiceImpl(
          gh<_i10.GoogleSignIn>(),
          gh<_i7.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i21.ConnectionService>(
        () => _i22.ConnectionServiceImpl(gh<_i3.Connectivity>()));
    gh.lazySingleton<_i23.ExpenseLocalDataSource>(
        () => _i24.ExpenseLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i6.ExpenseMapper>(),
            ));
    gh.lazySingleton<_i25.ExpenseRemoteDataSource>(
        () => _i26.ExpenseRemoteDataSourceImpl(gh<_i8.FirebaseFirestore>()));
    gh.lazySingleton<_i27.SpendingLocalDataSource>(
        () => _i28.SpendingLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i14.SpendingMapper>(),
            ));
    gh.lazySingleton<_i29.UserLocalDataSource>(
        () => _i30.UserLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i18.UserMapper>(),
            ));
    gh.lazySingleton<_i31.UserRemoteDataSource>(
        () => _i32.UserRemoteDataSourceImpl(gh<_i19.AuthService>()));
    gh.lazySingleton<_i33.UserRepository>(() => _i34.UserRepositoryImpl(
          gh<_i29.UserLocalDataSource>(),
          gh<_i31.UserRemoteDataSource>(),
          gh<_i27.SpendingLocalDataSource>(),
          gh<_i23.ExpenseLocalDataSource>(),
        ));
    gh.lazySingleton<_i35.UserUseCase>(
        () => _i36.UserInteractor(gh<_i33.UserRepository>()));
    gh.lazySingleton<_i37.ConnectionBloc>(
        () => _i37.ConnectionBloc(gh<_i21.ConnectionService>()));
    gh.lazySingleton<_i38.ExpenseRepository>(() => _i39.ExpenseRepositoryImpl(
          gh<_i25.ExpenseRemoteDataSource>(),
          gh<_i23.ExpenseLocalDataSource>(),
          gh<_i35.UserUseCase>(),
        ));
    gh.lazySingleton<_i40.ExpenseUseCase>(
        () => _i41.ExpenseInteractor(gh<_i38.ExpenseRepository>()));
    gh.lazySingleton<_i42.LoginBloc>(
        () => _i42.LoginBloc(gh<_i35.UserUseCase>()));
    gh.lazySingleton<_i43.SpendingRepository>(() => _i44.SpendingRepositoryImpl(
          gh<_i15.SpendingRemoteDataSource>(),
          gh<_i27.SpendingLocalDataSource>(),
          gh<_i29.UserLocalDataSource>(),
          gh<_i12.NotificationService>(),
        ));
    gh.lazySingleton<_i45.SpendingUseCase>(
        () => _i46.SpendingInteractor(gh<_i43.SpendingRepository>()));
    gh.lazySingleton<_i47.SplashBloc>(
        () => _i47.SplashBloc(gh<_i35.UserUseCase>()));
    gh.lazySingleton<_i48.SyncBloc>(
        () => _i48.SyncBloc(gh<_i45.SpendingUseCase>()));
    gh.lazySingleton<_i49.HomeBloc>(() => _i49.HomeBloc(
          gh<_i35.UserUseCase>(),
          gh<_i45.SpendingUseCase>(),
          gh<_i11.Logger>(),
        ));
    gh.lazySingleton<_i50.SpendingBloc>(
        () => _i50.SpendingBloc(gh<_i45.SpendingUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i51.RegisterModule {}
