import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/core/utils/utils.dart';
import 'package:spending/domain/usecases/user_usecase.dart';
import 'package:spending/presentation/screens/home/home_screen.dart';
import 'package:spending/presentation/screens/login/bloc/login_event.dart';
import 'package:spending/presentation/screens/login/bloc/login_state.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserUseCase _userUseCase;
  final Logger _logger;

  LoginBloc(
    this._userUseCase,
    this._logger,
  ) : super(const LoginState()) {
    on<LoginSignInWithGoogle>(_signInWithGoogle);
  }

  void _signInWithGoogle(
    LoginSignInWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    final context = event.context;
    Status status = Status.initial;

    emit(state.copyWith(status: Status.loading));

    try {
      final result = await _userUseCase.signIn();

      if (!context.mounted) return;

      if (!result) {
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
}
