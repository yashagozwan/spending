import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/utils/toast.dart';
import 'package:spending/domain/usecases/user_usecase.dart';
import 'package:spending/presentation/screens/login/bloc/login_event.dart';
import 'package:spending/presentation/screens/login/bloc/login_state.dart';
import 'package:spending/presentation/screens/sync/sync_screen.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserUseCase _userUseCase;

  LoginBloc(
    this._userUseCase,
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
        return Toast.show('Authentication failed', isError: true);
      }

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const SyncScreen();
        },
      ), (route) => false);

      status = Status.success;
      Toast.show('Authentication successful');
    } catch (e) {
      status = Status.failure;
      Toast.show('$e', isError: true);
    } finally {
      emit(state.copyWith(status: status));
    }
  }
}
