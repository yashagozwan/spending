import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/presentation/screens/login/bloc/login_event.dart';
import 'package:spending/presentation/screens/login/bloc/login_state.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;

  LoginBloc(this._authService) : super(const LoginState()) {
    on<LoginSignInWithGoogle>(_signInWithGoogle);
  }

  void _signInWithGoogle(
    LoginSignInWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authService.signInWithGoogle();
    } on FirebaseAuthException {}
  }
}
