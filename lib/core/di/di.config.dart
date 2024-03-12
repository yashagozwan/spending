// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:flutter/material.dart' as _i18;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i12;
import 'package:spending/core/di/register_module.dart' as _i50;
import 'package:spending/core/services/auth_service.dart' as _i20;
import 'package:spending/core/services/auth_service_impl.dart' as _i21;
import 'package:spending/core/services/connection_service.dart' as _i22;
import 'package:spending/core/services/connection_status_impl.dart' as _i23;
import 'package:spending/core/services/notification_service.dart' as _i13;
import 'package:spending/core/services/notification_service_impl.dart' as _i14;
import 'package:spending/core/theme/custom_theme.dart' as _i4;
import 'package:spending/data/mapper/spending_mapper.dart' as _i15;
import 'package:spending/data/mapper/user_mapper.dart' as _i19;
import 'package:spending/data/repositories/expense_repository_impl.dart'
    as _i38;
import 'package:spending/data/repositories/spending_repository_impl.dart'
    as _i43;
import 'package:spending/data/repositories/user_repository_impl.dart' as _i33;
import 'package:spending/data/sources/local/expense_local_data_source.dart'
    as _i6;
import 'package:spending/data/sources/local/expense_local_data_source_impl.dart'
    as _i7;
import 'package:spending/data/sources/local/floor/database_floor.dart' as _i5;
import 'package:spending/data/sources/local/spending_local_data_source.dart'
    as _i26;
import 'package:spending/data/sources/local/spending_local_data_source_impl.dart'
    as _i27;
import 'package:spending/data/sources/local/user_local_data_source.dart'
    as _i28;
import 'package:spending/data/sources/local/user_local_data_source_impl.dart'
    as _i29;
import 'package:spending/data/sources/remote/expense_remote_data_source.dart'
    as _i24;
import 'package:spending/data/sources/remote/expense_remote_data_source_impl.dart'
    as _i25;
import 'package:spending/data/sources/remote/spending_remote_data_source.dart'
    as _i16;
import 'package:spending/data/sources/remote/spending_remote_data_source_impl.dart'
    as _i17;
import 'package:spending/data/sources/remote/user_remote_data_source.dart'
    as _i30;
import 'package:spending/data/sources/remote/user_remote_data_source_impl.dart'
    as _i31;
import 'package:spending/domain/repositories/expense_repository.dart' as _i37;
import 'package:spending/domain/repositories/spending_repository.dart' as _i42;
import 'package:spending/domain/repositories/user_repository.dart' as _i32;
import 'package:spending/domain/usecases/expense_interactor.dart' as _i40;
import 'package:spending/domain/usecases/expense_usecase.dart' as _i39;
import 'package:spending/domain/usecases/spending_interactor.dart' as _i45;
import 'package:spending/domain/usecases/spending_usecase.dart' as _i44;
import 'package:spending/domain/usecases/user_interactor.dart' as _i35;
import 'package:spending/domain/usecases/user_usecase.dart' as _i34;
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart'
    as _i36;
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart' as _i48;
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart'
    as _i41;
import 'package:spending/presentation/screens/spending/bloc/spending_bloc.dart'
    as _i49;
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart'
    as _i46;
import 'package:spending/presentation/screens/sync/bloc/sync_bloc.dart' as _i47;

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
    gh.lazySingleton<_i6.ExpenseLocalDataSource>(
        () => _i7.ExpenseLocalDataSourceImpl(gh<_i5.DatabaseFloor>()));
    gh.lazySingleton<_i8.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i9.FirebaseFirestore>(
        () => registerModule.firebaseFirestore);
    gh.lazySingleton<_i10.FlutterLocalNotificationsPlugin>(
        () => registerModule.flutterNotificationsPlugin);
    gh.lazySingleton<_i11.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i12.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i13.NotificationService>(
        () => _i14.NotificationServiceImpl(
              gh<_i10.FlutterLocalNotificationsPlugin>(),
              gh<_i12.Logger>(),
            ));
    gh.lazySingleton<_i15.SpendingMapper>(() => _i15.SpendingMapper());
    gh.lazySingleton<_i16.SpendingRemoteDataSource>(
        () => _i17.SpendingRemoteDataSourceImpl(gh<_i9.FirebaseFirestore>()));
    gh.factory<_i18.TextEditingController>(
        () => registerModule.textEditingController);
    gh.lazySingleton<_i19.UserMapper>(() => _i19.UserMapper());
    gh.lazySingleton<_i20.AuthService>(() => _i21.AuthServiceImpl(
          gh<_i11.GoogleSignIn>(),
          gh<_i8.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i22.ConnectionService>(
        () => _i23.ConnectionServiceImpl(gh<_i3.Connectivity>()));
    gh.lazySingleton<_i24.ExpenseRemoteDataSource>(
        () => _i25.ExpenseRemoteDataSourceImpl(gh<_i9.FirebaseFirestore>()));
    gh.lazySingleton<_i26.SpendingLocalDataSource>(
        () => _i27.SpendingLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i15.SpendingMapper>(),
            ));
    gh.lazySingleton<_i28.UserLocalDataSource>(
        () => _i29.UserLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i19.UserMapper>(),
            ));
    gh.lazySingleton<_i30.UserRemoteDataSource>(
        () => _i31.UserRemoteDataSourceImpl(gh<_i20.AuthService>()));
    gh.lazySingleton<_i32.UserRepository>(() => _i33.UserRepositoryImpl(
          gh<_i28.UserLocalDataSource>(),
          gh<_i30.UserRemoteDataSource>(),
          gh<_i26.SpendingLocalDataSource>(),
          gh<_i6.ExpenseLocalDataSource>(),
        ));
    gh.lazySingleton<_i34.UserUseCase>(
        () => _i35.UserInteractor(gh<_i32.UserRepository>()));
    gh.lazySingleton<_i36.ConnectionBloc>(
        () => _i36.ConnectionBloc(gh<_i22.ConnectionService>()));
    gh.lazySingleton<_i37.ExpenseRepository>(() => _i38.ExpenseRepositoryImpl(
          gh<_i24.ExpenseRemoteDataSource>(),
          gh<_i6.ExpenseLocalDataSource>(),
          gh<_i34.UserUseCase>(),
        ));
    gh.lazySingleton<_i39.ExpenseUseCase>(
        () => _i40.ExpenseInteractor(gh<_i37.ExpenseRepository>()));
    gh.lazySingleton<_i41.LoginBloc>(
        () => _i41.LoginBloc(gh<_i34.UserUseCase>()));
    gh.lazySingleton<_i42.SpendingRepository>(() => _i43.SpendingRepositoryImpl(
          gh<_i16.SpendingRemoteDataSource>(),
          gh<_i26.SpendingLocalDataSource>(),
          gh<_i28.UserLocalDataSource>(),
          gh<_i13.NotificationService>(),
        ));
    gh.lazySingleton<_i44.SpendingUseCase>(
        () => _i45.SpendingInteractor(gh<_i42.SpendingRepository>()));
    gh.lazySingleton<_i46.SplashBloc>(
        () => _i46.SplashBloc(gh<_i34.UserUseCase>()));
    gh.lazySingleton<_i47.SyncBloc>(
        () => _i47.SyncBloc(gh<_i44.SpendingUseCase>()));
    gh.lazySingleton<_i48.HomeBloc>(() => _i48.HomeBloc(
          gh<_i34.UserUseCase>(),
          gh<_i44.SpendingUseCase>(),
          gh<_i12.Logger>(),
        ));
    gh.lazySingleton<_i49.SpendingBloc>(
        () => _i49.SpendingBloc(gh<_i44.SpendingUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i50.RegisterModule {}
