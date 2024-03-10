import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/core/services/auth_service_impl.dart';
import 'package:spending/core/services/connection_service.dart';
import 'package:spending/core/services/connection_status_impl.dart';
import 'package:spending/core/utils/toast.dart';
import 'package:spending/presentation/screens/connection/connection_screen.dart';
import 'package:spending/presentation/screens/home/home_screen.dart';
import 'package:spending/presentation/screens/login/login_screen.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_event.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_state.dart';

@lazySingleton
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthService _authService;
  final ConnectionService _connectionService;

  SplashBloc(
    @Named.from(AuthServiceImpl) this._authService,
    @Named.from(ConnectionServiceImpl) this._connectionService,
  ) : super(const SplashState()) {
    on<SplashInitial>(_initial);
    on<SplashStarted>(_started);
  }

  void _initial(SplashInitial event, Emitter<SplashState> emit) async {

  }

  void _started(SplashStarted event, Emitter<SplashState> emit) async {
    final result = await _authService.isLoggedId();
    final context = event.context;

    await Future.delayed(const Duration(milliseconds: 1000));
    FlutterNativeSplash.remove();

    await Future.delayed(const Duration(milliseconds: 1000));

    if (!context.mounted) return;

    if (result) {
      Navigator.pushAndRemoveUntil(event.context, MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(event.context, MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ), (route) => false);
    }
  }
}
