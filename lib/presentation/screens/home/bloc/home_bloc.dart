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
import 'package:spending/presentation/widgets/spacer_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserUseCase _userUseCase;
  final SpendingUseCase _spendingUseCase;
  final Logger _logger;
  final TextEditingController titleController;

  HomeBloc(
    this._userUseCase,
    this._spendingUseCase,
    this._logger,
    this.titleController,
  ) : super(const HomeState()) {
    on<HomeInitial>(_initial);
    on<HomeStarted>(_started);
    on<HomeShowUserDetailBottomSheet>(_showUserDetailBottomSheet);
    on<HomeShowCreateReportBottomSheet>(_showCreateReportBottomSheet);
    on<HomeSetDateIso>(_setDateIso);
    on<HomeSetSpendingTitle>(_setSpendingTitle);
    on<HomeCreateReport>(_createReport);
    on<HomeLogout>(_logout);
  }

  void _setDateIso(HomeSetDateIso event, Emitter<HomeState> emit) =>
      emit(state.copyWith(dateIso: event.value));

  void _setSpendingTitle(HomeSetSpendingTitle event, Emitter<HomeState> emit) =>
      emit(state.copyWith(spendingTitle: event.value));

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
      _logger.d(e);

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
        userId: state.user.id,
        title: state.spendingTitle,
        createdAt: state.dateIso,
      );
      await _spendingUseCase.insertOneNetwork(spending);
      final spendings = await _spendingUseCase.findAll();
      emit(state.copyWith(spendings: spendings));
    } catch (e) {
      Toast.show('$e', isError: true);
    }
  }

  void _showDatePickerBottomSheet(
    BuildContext context,
    TextEditingController dateController,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: SfDateRangePicker(
            initialDisplayDate: DateTime.now(),
            selectionMode: DateRangePickerSelectionMode.single,
            onSelectionChanged: (args) {
              final value = args.value;

              if (value is DateTime) {
                dateController.text = value.toIso8601String();
                Navigator.pop(context);
              }
            },
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
    );
  }

  void _showCreateReportBottomSheet(
    HomeShowCreateReportBottomSheet event,
    Emitter<HomeState> emit,
  ) async {
    showModalBottomSheet(
      context: event.context,
      builder: (context) {
        return SpacerWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Spending',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "What is your spending title?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: event.titleController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Write...',
                  helperText: 'If not filled it will be "My Spending"',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Whether in this month?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 4),
              TextField(
                onTap: () {
                  _showDatePickerBottomSheet(context, event.dateController);
                },
                controller: event.dateController,
                readOnly: true,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Please enter date',
                  helperText: 'If not selected then the date is this month',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showDatePickerBottomSheet(context, event.dateController);
                    },
                    icon: const FaIcon(FontAwesomeIcons.calendarDay),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  VoidCallback? onPressed;

                  if (state.spendingTitle.isNotEmpty &&
                      state.dateIso.isNotEmpty) {
                    onPressed = () {
                      context.read<HomeBloc>().add(const HomeCreateReport());
                      event.titleController.clear();
                      event.dateController.clear();
                      Navigator.pop(context);
                    };
                  }

                  return ElevatedButton.icon(
                    onPressed: onPressed,
                    icon: const FaIcon(FontAwesomeIcons.circlePlus),
                    label: const Text("Create Report"),
                  );
                },
              ),
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
    );
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
    } catch (e) {
      Toast.show('$e', isError: true);
    }
  }

  void dispose() {
    titleController.dispose();
  }
}
