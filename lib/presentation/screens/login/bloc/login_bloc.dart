import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/core/services/auth_service_impl.dart';
import 'package:spending/core/utils/utils.dart';
import 'package:spending/presentation/screens/home/home_screen.dart';
import 'package:spending/presentation/screens/login/bloc/login_event.dart';
import 'package:spending/presentation/screens/login/bloc/login_state.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;
  final Logger _logger;

  LoginBloc(
    @Named.from(AuthServiceImpl) this._authService,
    this._logger,
  ) : super(const LoginState()) {
    on<LoginSignInWithGoogle>(_signInWithGoogle);
    on<LoginSignOut>(_logout);
  }

  void _signInWithGoogle(
    LoginSignInWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    final context = event.context;
    Status status = Status.initial;

    emit(state.copyWith(status: Status.loading));

    try {
      final user = await _authService.signInWithGoogle();

      if (!context.mounted) return;

      if (user == null) {
        return Utils.showMessage(
          context,
          message: 'Authentication failed',
        );
      }

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ), (route) => false);

      status = Status.success;
    } on FirebaseAuthException catch (e) {
      status = Status.failure;
    } finally {
      emit(state.copyWith(status: status));
    }
  }

  void _logout(LoginSignOut event, Emitter<LoginState> emit) async {
    try {
      await _authService.signOut();
    } on FirebaseAuthException {}
  }
}
