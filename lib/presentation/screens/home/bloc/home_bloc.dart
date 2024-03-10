import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/core/services/auth_service_impl.dart';
import 'package:spending/presentation/screens/home/bloc/home_event.dart';
import 'package:spending/presentation/screens/home/bloc/home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthService _authService;

  HomeBloc(
    @Named.from(AuthServiceImpl) this._authService,
  ) : super(const HomeState()) {
    on<HomeLogout>(_logout);
  }

  void _logout(HomeLogout event, Emitter<HomeState> emit) async {
    final context = event.context;

    emit(state.copyWith(status: Status.loading));

    try {
      final user = await _authService.signOut();


      if(user == null) return;


    } on FirebaseAuthException catch (e) {}
  }
}
