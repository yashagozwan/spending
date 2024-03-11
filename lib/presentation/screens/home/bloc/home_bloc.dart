import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/core/utils/toast.dart';
import 'package:spending/core/utils/utils.dart';
import 'package:spending/domain/models/spending/spending_model.dart';
import 'package:spending/domain/usecases/spending_usecase.dart';
import 'package:spending/domain/usecases/user_usecase.dart';
import 'package:spending/presentation/screens/home/bloc/home_event.dart';
import 'package:spending/presentation/screens/home/bloc/home_state.dart';
import 'package:spending/presentation/screens/login/login_screen.dart';
import 'package:spending/presentation/widgets/image_widget.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserUseCase _userUseCase;
  final SpendingUseCase _spendingUseCase;
  final Logger _logger;

  HomeBloc(
    this._userUseCase,
    this._spendingUseCase,
    this._logger,
  ) : super(const HomeState()) {
    on<HomeInitial>(_initial);
    on<HomeStarted>(_started);
    on<HomeShowUserDetailBottomSheet>(_showUserDetailBottomSheet);
    on<HomeCreateReport>(_createReport);
    on<HomeLogout>(_logout);
  }

  void _initial(HomeInitial event, Emitter<HomeState> emit) =>
      emit(const HomeState());

  void _started(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final spendings = await _spendingUseCase.findAll();
      final user = (await _userUseCase.getUser())!;
      emit(state.copyWith(
        user: user,
        spendings: spendings,
        status: Status.success,
      ));
    } catch (e) {
      Toast.show('$e', isError: true);
    }
  }

  void _showUserDetailBottomSheet(
    HomeShowUserDetailBottomSheet event,
    Emitter<HomeState> emit,
  ) {
    final user = state.user;

    showModalBottomSheet(
      context: event.context,
      builder: (context) {
        return Column(
          children: [
            const SizedBox(height: 24),
            const Text(
              'Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            ImageWidget(
              url: user.avatar,
              size: 90,
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(user.email),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                context.read<HomeBloc>().add(HomeLogout(context: context));
              },
              icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
              label: const Text('SIGN OUT'),
            )
          ],
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
    );
  }

  void _createReport(HomeCreateReport event, Emitter<HomeState> emit) async {
    try {
      final spending = SpendingModel(
        title: 'Hello World',
        createdAt: DateTime.now().toIso8601String(),
        userId: state.user.id,
      );

      final result = await _spendingUseCase.insertOne(spending);
      final spendings = await _spendingUseCase.findAll();
      emit(state.copyWith(spendings: spendings));
    } catch (e) {
      Toast.show('$e', isError: true);
    }
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

      context.read<HomeBloc>().add(const HomeInitial());
    } catch (_) {
      _logger.d(_);
    }
  }
}
