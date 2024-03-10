import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/core/utils/utils.dart';
import 'package:spending/domain/usecases/user_usecase.dart';
import 'package:spending/presentation/screens/home/bloc/home_event.dart';
import 'package:spending/presentation/screens/home/bloc/home_state.dart';
import 'package:spending/presentation/screens/login/login_screen.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserUseCase _userUseCase;

  HomeBloc(
    this._userUseCase,
  ) : super(const HomeState()) {
    on<HomeLogout>(_logout);
  }

  void _logout(HomeLogout event, Emitter<HomeState> emit) async {
    final context = event.context;

    emit(state.copyWith(status: Status.loading));

    try {
      final result = await _userUseCase.signOut();

      if (!context.mounted) return;

      if (!result) {
        return Utils.showMessage(context, message: 'User not found');
      }

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ), (route) => false);
    } on FirebaseAuthException catch (e) {}
  }
}
