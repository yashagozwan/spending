import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spending/core/constants/image_asset_path.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/theme/custom_theme.dart';
import 'package:spending/core/utils/utils.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_event.dart';
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart';
import 'package:spending/presentation/screens/home/bloc/home_event.dart';
import 'package:spending/presentation/screens/home/bloc/home_state.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_bloc.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_event.dart';
import 'package:spending/presentation/screens/spending/spending_screen.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:spending/presentation/widgets/image_widget.dart';
import 'package:spending/presentation/widgets/spacer_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spending/presentation/widgets/touchable_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc bloc;
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _datePreviewController = TextEditingController();

  void _initial() {
    context.read<ConnectionBloc>().add(ConnectionSetContext(context: context));
    bloc = context.read<HomeBloc>()..add(const HomeStarted());

    _titleController.addListener(() {
      bloc.add(HomeSetSpendingTitle(value: _titleController.text.trim()));
    });

    _dateController.addListener(() {
      bloc.add(HomeSetDateIso(value: _dateController.text));
    });
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _datePreviewController.dispose();
    super.dispose();
  }

  void _showCreateReportBottomSheet() {
    bloc.add(
      HomeShowCreateReportBottomSheet(
        context: context,
        titleController: _titleController,
        dateController: _dateController,
        datePreviewController: _datePreviewController,
      ),
    );
  }

  Future<bool> _showExitAlertDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(ImageAssetPath.logout),
              ),
              const SizedBox(height: 16),
              const Text(
                'Exit App?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Do you really want to leave?',
                style: TextStyle(color: Colors.black45),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text('Yes'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('No'),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitAlertDialog();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              SpacerWidget(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    final user = state.user;

                    if (state.status == Status.loading) {
                      return const SizedBox();
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hi,',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            bloc.add(
                              HomeShowUserDetailBottomSheet(context: context),
                            );
                          },
                          child: ImageWidget(
                            size: 70,
                            url: user.avatar,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const SpacerWidget(
                child: Text(
                  'Activity',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SpacerWidget(
                child: Row(
                  children: [
                    Expanded(
                      child: _boxButton(
                        title: 'Create Report',
                        onPressed: _showCreateReportBottomSheet,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _boxButton(
                        title: 'Analytic',
                        faIconData: FontAwesomeIcons.chartLine,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SpacerWidget(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Reports',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('More'),
                    )
                  ],
                ),
              ),
              Expanded(
                child: _spendingsWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _spendingsWidget() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final spendings = state.spendings;

        if (spendings.isEmpty) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      ImageAssetPath.emptyBox,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No record of expenditure',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _showCreateReportBottomSheet,
                    icon: const FaIcon(FontAwesomeIcons.circlePlus),
                    label: const Text('Create'),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemBuilder: (context, index) {
            final spending = spendings[index];
            return Slidable(
              endActionPane: ActionPane(
                motion: const BehindMotion(),
                children: [
                  Builder(builder: (ctx) {
                    return MaterialButton(
                      color: Colors.red,
                      padding: const EdgeInsets.all(12),
                      shape: const CircleBorder(),
                      child: const FaIcon(
                        FontAwesomeIcons.trash,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Slidable.of(ctx)?.close();

                        bloc.add(
                          HomeRemoveShowAlertDialog(
                            context: context,
                            spending: spending,
                          ),
                        );
                      },
                    );
                  }),
                  Builder(builder: (ctx) {
                    return _slideButton(
                      onPressed: () {
                        Slidable.of(ctx)?.close();
                        bloc.add(
                          HomeShowCreateReportBottomSheet(
                            context: context,
                            titleController: _titleController,
                            dateController: _dateController,
                            datePreviewController: _datePreviewController,
                            spending: spending,
                            isUpdate: true,
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
              child: TouchableWidget(
                onPressed: () {
                  context
                      .read<SpendingBloc>()
                      .add(SpendingSetId(id: spending.id, context: context));
                },
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              spending.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              Utils.dateFormat(spending.createdAt),
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const Text(
                              'Current Money',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const Text(
                              'IDR 1.000.000',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: CustomTheme.primary,
                          shape: BoxShape.circle,
                        ),
                        width: 60,
                        height: 60,
                        child: Image.asset(ImageAssetPath.spending),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemCount: spendings.length,
        );
      },
    );
  }

  Widget _slideButton({
    void Function()? onPressed,
    Color color = Colors.green,
    IconData faIconData = FontAwesomeIcons.pencil,
  }) {
    return MaterialButton(
      color: color,
      padding: const EdgeInsets.all(12),
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: FaIcon(
        faIconData,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  Widget _boxButton({
    VoidCallback? onPressed,
    IconData faIconData = FontAwesomeIcons.circlePlus,
    String title = 'Title',
  }) {
    const rounded = 24.0;
    return TouchableWidget(
      rounded: rounded,
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: CustomTheme.primary,
          borderRadius: BorderRadius.circular(rounded),
        ),
        child: Column(
          children: [
            FaIcon(
              faIconData,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
