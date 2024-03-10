import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/core/services/auth_service_impl.dart';
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
    try {
      final user = await _authService.signInWithGoogle();
      _logger.d(user);
    } on FirebaseAuthException {}
  }

  void _logout(LoginSignOut event, Emitter<LoginState> emit) async {
    try {
      await _authService.signOut();
    } on FirebaseAuthException {}
  }
}
