import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/domain/usecases/user_usecase.dart';
import 'package:spending/presentation/screens/home/home_screen.dart';
import 'package:spending/presentation/screens/login/login_screen.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_event.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_state.dart';

@lazySingleton
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserUseCase _userUseCase;

  SplashBloc(
    this._userUseCase,
  ) : super(const SplashState()) {
    on<SplashInitial>(_initial);
    on<SplashStarted>(_started);
  }

  void _initial(SplashInitial event, Emitter<SplashState> emit) async {}

  void _started(SplashStarted event, Emitter<SplashState> emit) async {
    final user = await _userUseCase.getUser();
    final context = event.context;

    await Future.delayed(const Duration(milliseconds: 1000));
    FlutterNativeSplash.remove();

    await Future.delayed(const Duration(milliseconds: 1000));

    if (!context.mounted) return;

    if (user != null) {
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
