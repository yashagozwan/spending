import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/core/constants/image_asset_path.dart';
import 'package:spending/core/constants/status.dart';
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

  HomeBloc(
    this._userUseCase,
    this._spendingUseCase,
    this._logger,
  ) : super(const HomeState()) {
    on<HomeInitial>(_initial);
    on<HomeStarted>(_started);
    on<HomeShowUserDetailBottomSheet>(_showUserDetailBottomSheet);
    on<HomeShowCreateReportBottomSheet>(_showCreateReportBottomSheet);
    on<HomeSetDateIso>(_setDateIso);
    on<HomeSetSpendingTitle>(_setSpendingTitle);
    on<HomeCreateReport>(_createReport);
    on<HomeUpdateReport>(_updateReport);
    on<HomeRemoveShowAlertDialog>(_showRemoveAlertDialog);
    on<HomeRemoveSpending>(_doRemoveSpending);
    on<HomeLogout>(_logout);
  }

  final shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(24),
    ),
  );

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
      emit(state.copyWith(status: Status.failure));
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
      shape: shape,
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

  void _updateReport(HomeUpdateReport event, Emitter<HomeState> emit) async {
    try {
      await _spendingUseCase.updateOne(event.spending);
      final spendings = await _spendingUseCase.findAll();
      emit(state.copyWith(spendings: spendings));
      Toast.show('The report has been updated successfully');
    } catch (e) {
      Toast.show('$e', isError: true);
    }
  }

  void _showDatePickerBottomSheet(
    BuildContext context,
    TextEditingController dateController,
    TextEditingController datePreviewController,
    bool isUpdate,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        DateTime date;

        if (isUpdate) {
          date = DateTime.parse(dateController.text);
        } else {
          date = DateTime.now();
        }

        return Padding(
          padding: const EdgeInsets.all(24),
          child: SfDateRangePicker(
            initialDisplayDate: date,
            initialSelectedDate: isUpdate ? date : null,
            selectionMode: DateRangePickerSelectionMode.single,
            onSelectionChanged: (args) {
              final value = args.value;
              if (value is DateTime) {
                dateController.text = value.toIso8601String();
                datePreviewController.text =
                    Utils.dateFormat(value.toIso8601String());
                Navigator.pop(context);
              }
            },
          ),
        );
      },
      shape: shape,
    );
  }

  void _doRemoveSpending(
    HomeRemoveSpending event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _spendingUseCase.removeOne(event.spending);
      final spendings = await _spendingUseCase.findAll();
      emit(state.copyWith(spendings: spendings));
      Toast.show(
        'Report successfully deleted.',
      );
    } catch (e) {
      Toast.show('$e', isError: true);
    }
  }

  void _showCreateReportBottomSheet(
    HomeShowCreateReportBottomSheet event,
    Emitter<HomeState> emit,
  ) async {
    final titleController = event.titleController;
    final datePreviewController = event.datePreviewController;
    final dateController = event.dateController;
    final isUpdate = event.isUpdate;
    final spending = event.spending;

    void clearTextField() {
      titleController.clear();
      dateController.clear();
      datePreviewController.clear();
    }

    if (isUpdate && spending != null) {
      titleController.text = spending.title;
      dateController.text = spending.createdAt;
      datePreviewController.text = Utils.dateFormat(spending.createdAt);
    } else {
      clearTextField();
    }

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
                controller: titleController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Write...',

                  /// helperText: 'If not filled it will be "My Spending"',
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
              Builder(
                builder: (context) {
                  void onPressed() {
                    _showDatePickerBottomSheet(
                      context,
                      dateController,
                      datePreviewController,
                      isUpdate,
                    );
                  }

                  return TextField(
                    onTap: onPressed,
                    controller: datePreviewController,
                    readOnly: true,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Enter date',

                      /// helperText: 'If not selected then the date is this month',
                      suffixIcon: IconButton(
                        onPressed: onPressed,
                        icon: const FaIcon(FontAwesomeIcons.calendarDay),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  VoidCallback? onPressed;

                  final isValid = state.spendingTitle.isNotEmpty &&
                      state.dateIso.isNotEmpty;

                  var title = 'Create Report';

                  if (isValid && isUpdate) {
                    title = 'Update Report';
                    onPressed = () {
                      var mSpending = spending!.copyWith(
                        title: state.spendingTitle,
                        createdAt: state.dateIso,
                      );

                      context
                          .read<HomeBloc>()
                          .add(HomeUpdateReport(spending: mSpending));
                      clearTextField();
                      Navigator.pop(context);
                    };
                  } else if (isValid) {
                    onPressed = () {
                      context.read<HomeBloc>().add(const HomeCreateReport());
                      clearTextField();
                      Navigator.pop(context);
                    };
                  }

                  return ElevatedButton(
                    onPressed: onPressed,
                    child: Text(title),
                  );
                },
              ),
            ],
          ),
        );
      },
      shape: shape,
    );
  }

  void _showRemoveAlertDialog(
    HomeRemoveShowAlertDialog event,
    Emitter<HomeState> emit,
  ) async {
    showDialog(
      context: event.context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 130,
                height: 130,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Image.asset(
                  ImageAssetPath.deleteFile,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Delete Report?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'If you delete this report, it cannot be returned.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(HomeRemoveSpending(spending: event.spending));

                        Navigator.pop(context);
                      },
                      child: const Text('Yes'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
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
}
