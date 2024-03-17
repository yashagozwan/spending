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
import 'package:flutter/material.dart' as _i20;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i14;
import 'package:spending/core/di/register_module.dart' as _i60;
import 'package:spending/core/services/auth_service.dart' as _i22;
import 'package:spending/core/services/auth_service_impl.dart' as _i23;
import 'package:spending/core/services/connection_service.dart' as _i24;
import 'package:spending/core/services/connection_status_impl.dart' as _i25;
import 'package:spending/core/services/notification_service.dart' as _i15;
import 'package:spending/core/services/notification_service_impl.dart' as _i16;
import 'package:spending/core/theme/custom_theme.dart' as _i4;
import 'package:spending/data/mapper/expense_mapper.dart' as _i6;
import 'package:spending/data/mapper/income_mapper.dart' as _i11;
import 'package:spending/data/mapper/spending_mapper.dart' as _i17;
import 'package:spending/data/mapper/user_mapper.dart' as _i21;
import 'package:spending/data/repositories/expense_repository_impl.dart'
    as _i44;
import 'package:spending/data/repositories/income_repository_impl.dart' as _i48;
import 'package:spending/data/repositories/spending_repository_impl.dart'
    as _i53;
import 'package:spending/data/repositories/user_repository_impl.dart' as _i39;
import 'package:spending/data/sources/local/expense_local_data_source.dart'
    as _i26;
import 'package:spending/data/sources/local/expense_local_data_source_impl.dart'
    as _i27;
import 'package:spending/data/sources/local/floor/database_floor.dart' as _i5;
import 'package:spending/data/sources/local/income_local_data_source.dart'
    as _i30;
import 'package:spending/data/sources/local/income_local_data_source_impl.dart'
    as _i31;
import 'package:spending/data/sources/local/spending_local_data_source.dart'
    as _i32;
import 'package:spending/data/sources/local/spending_local_data_source_impl.dart'
    as _i33;
import 'package:spending/data/sources/local/user_local_data_source.dart'
    as _i34;
import 'package:spending/data/sources/local/user_local_data_source_impl.dart'
    as _i35;
import 'package:spending/data/sources/remote/expense_remote_data_source.dart'
    as _i28;
import 'package:spending/data/sources/remote/expense_remote_data_source_impl.dart'
    as _i29;
import 'package:spending/data/sources/remote/income_remote_data_source.dart'
    as _i12;
import 'package:spending/data/sources/remote/income_remote_data_source_impl.dart'
    as _i13;
import 'package:spending/data/sources/remote/spending_remote_data_source.dart'
    as _i18;
import 'package:spending/data/sources/remote/spending_remote_data_source_impl.dart'
    as _i19;
import 'package:spending/data/sources/remote/user_remote_data_source.dart'
    as _i36;
import 'package:spending/data/sources/remote/user_remote_data_source_impl.dart'
    as _i37;
import 'package:spending/domain/repositories/expense_repository.dart' as _i43;
import 'package:spending/domain/repositories/income_repository.dart' as _i47;
import 'package:spending/domain/repositories/spending_repository.dart' as _i52;
import 'package:spending/domain/repositories/user_repository.dart' as _i38;
import 'package:spending/domain/usecases/expense_interactor.dart' as _i46;
import 'package:spending/domain/usecases/expense_usecase.dart' as _i45;
import 'package:spending/domain/usecases/income_interactor.dart' as _i50;
import 'package:spending/domain/usecases/income_usecase.dart' as _i49;
import 'package:spending/domain/usecases/spending_interactor.dart' as _i55;
import 'package:spending/domain/usecases/spending_usecase.dart' as _i54;
import 'package:spending/domain/usecases/user_interactor.dart' as _i41;
import 'package:spending/domain/usecases/user_usecase.dart' as _i40;
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart'
    as _i42;
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart' as _i58;
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart'
    as _i51;
import 'package:spending/presentation/screens/spending/bloc/spending_bloc.dart'
    as _i59;
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart'
    as _i56;
import 'package:spending/presentation/screens/sync/bloc/sync_bloc.dart' as _i57;

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
    gh.lazySingleton<_i11.IncomeMapper>(() => _i11.IncomeMapper());
    gh.lazySingleton<_i12.IncomeRemoteDataSource>(
        () => _i13.IncomeRemoteDataSourceImpl(gh<_i8.FirebaseFirestore>()));
    gh.lazySingleton<_i14.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i15.NotificationService>(
        () => _i16.NotificationServiceImpl(
              gh<_i9.FlutterLocalNotificationsPlugin>(),
              gh<_i14.Logger>(),
            ));
    gh.lazySingleton<_i17.SpendingMapper>(() => _i17.SpendingMapper());
    gh.lazySingleton<_i18.SpendingRemoteDataSource>(
        () => _i19.SpendingRemoteDataSourceImpl(gh<_i8.FirebaseFirestore>()));
    gh.factory<_i20.TextEditingController>(
        () => registerModule.textEditingController);
    gh.lazySingleton<_i21.UserMapper>(() => _i21.UserMapper());
    gh.lazySingleton<_i22.AuthService>(() => _i23.AuthServiceImpl(
          gh<_i10.GoogleSignIn>(),
          gh<_i7.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i24.ConnectionService>(
        () => _i25.ConnectionServiceImpl(gh<_i3.Connectivity>()));
    gh.lazySingleton<_i26.ExpenseLocalDataSource>(
        () => _i27.ExpenseLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i6.ExpenseMapper>(),
            ));
    gh.lazySingleton<_i28.ExpenseRemoteDataSource>(
        () => _i29.ExpenseRemoteDataSourceImpl(gh<_i8.FirebaseFirestore>()));
    gh.lazySingleton<_i30.IncomeLocalDataSource>(
        () => _i31.IncomeLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i11.IncomeMapper>(),
            ));
    gh.lazySingleton<_i32.SpendingLocalDataSource>(
        () => _i33.SpendingLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i17.SpendingMapper>(),
            ));
    gh.lazySingleton<_i34.UserLocalDataSource>(
        () => _i35.UserLocalDataSourceImpl(
              gh<_i5.DatabaseFloor>(),
              gh<_i21.UserMapper>(),
            ));
    gh.lazySingleton<_i36.UserRemoteDataSource>(
        () => _i37.UserRemoteDataSourceImpl(gh<_i22.AuthService>()));
    gh.lazySingleton<_i38.UserRepository>(() => _i39.UserRepositoryImpl(
          gh<_i34.UserLocalDataSource>(),
          gh<_i36.UserRemoteDataSource>(),
          gh<_i32.SpendingLocalDataSource>(),
          gh<_i26.ExpenseLocalDataSource>(),
          gh<_i30.IncomeLocalDataSource>(),
        ));
    gh.lazySingleton<_i40.UserUseCase>(
        () => _i41.UserInteractor(gh<_i38.UserRepository>()));
    gh.lazySingleton<_i42.ConnectionBloc>(
        () => _i42.ConnectionBloc(gh<_i24.ConnectionService>()));
    gh.lazySingleton<_i43.ExpenseRepository>(() => _i44.ExpenseRepositoryImpl(
          gh<_i28.ExpenseRemoteDataSource>(),
          gh<_i26.ExpenseLocalDataSource>(),
          gh<_i40.UserUseCase>(),
        ));
    gh.lazySingleton<_i45.ExpenseUseCase>(
        () => _i46.ExpenseInteractor(gh<_i43.ExpenseRepository>()));
    gh.lazySingleton<_i47.IncomeRepository>(() => _i48.IncomeRepositoryImpl(
          gh<_i30.IncomeLocalDataSource>(),
          gh<_i12.IncomeRemoteDataSource>(),
          gh<_i34.UserLocalDataSource>(),
        ));
    gh.lazySingleton<_i49.IncomeUseCase>(
        () => _i50.IncomeInteractor(gh<_i47.IncomeRepository>()));
    gh.lazySingleton<_i51.LoginBloc>(
        () => _i51.LoginBloc(gh<_i40.UserUseCase>()));
    gh.lazySingleton<_i52.SpendingRepository>(() => _i53.SpendingRepositoryImpl(
          gh<_i18.SpendingRemoteDataSource>(),
          gh<_i32.SpendingLocalDataSource>(),
          gh<_i34.UserLocalDataSource>(),
          gh<_i15.NotificationService>(),
        ));
    gh.lazySingleton<_i54.SpendingUseCase>(
        () => _i55.SpendingInteractor(gh<_i52.SpendingRepository>()));
    gh.lazySingleton<_i56.SplashBloc>(
        () => _i56.SplashBloc(gh<_i40.UserUseCase>()));
    gh.lazySingleton<_i57.SyncBloc>(() => _i57.SyncBloc(
          gh<_i54.SpendingUseCase>(),
          gh<_i45.ExpenseUseCase>(),
          gh<_i49.IncomeUseCase>(),
        ));
    gh.lazySingleton<_i58.HomeBloc>(() => _i58.HomeBloc(
          gh<_i40.UserUseCase>(),
          gh<_i54.SpendingUseCase>(),
          gh<_i14.Logger>(),
        ));
    gh.lazySingleton<_i59.SpendingBloc>(() => _i59.SpendingBloc(
          gh<_i54.SpendingUseCase>(),
          gh<_i45.ExpenseUseCase>(),
          gh<_i49.IncomeUseCase>(),
          gh<_i14.Logger>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i60.RegisterModule {}
