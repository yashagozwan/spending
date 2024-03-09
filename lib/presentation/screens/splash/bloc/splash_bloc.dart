import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_event.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_state.dart';

@lazySingleton
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthService _authService;

  SplashBloc(this._authService) : super(const SplashState()) {
    on<SplashStarted>(_started);
  }

  void _started(SplashStarted event, Emitter<SplashState> emit) async {
    await _authService.isSignedIn();
  }
}
