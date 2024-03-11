import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spending/core/constants/image_asset_path.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/theme/custom_theme.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_event.dart';
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart';
import 'package:spending/presentation/screens/home/bloc/home_event.dart';
import 'package:spending/presentation/screens/home/bloc/home_state.dart';
import 'package:spending/presentation/widgets/image_widget.dart';
import 'package:spending/presentation/widgets/spacer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ConnectionBloc>().add(ConnectionSetContext(context: context));
    final bloc = context.read<HomeBloc>()..add(const HomeStarted());

    return Scaffold(
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
                      onPressed: () {
                        bloc.add(const HomeCreateReport());
                      },
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
              child: _spendingsWidget(bloc),
            ),
          ],
        ),
      ),
    );
  }

  Widget _spendingsWidget(HomeBloc bloc) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final spendings = state.spendings;

        if (spendings.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
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
                  onPressed: () {
                    bloc.add(const HomeCreateReport());
                  },
                  icon: const FaIcon(FontAwesomeIcons.circlePlus),
                  label: const Text('Create'),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          itemBuilder: (context, index) {
            return Container(
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
                          'My Spending',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: CustomTheme.secondary,
                          ),
                        ),
                        const Text(
                          '20 Mei 2023',
                          style: TextStyle(
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
                      color: CustomTheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    width: 60,
                    height: 60,
                    child: Image.asset(ImageAssetPath.spending),
                  ),
                ],
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

  Widget _boxButton({
    VoidCallback? onPressed,
    IconData faIconData = FontAwesomeIcons.circlePlus,
    String title = 'Title',
  }) {
    final borderRadius = BorderRadius.circular(24);

    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: CustomTheme.secondary,
            borderRadius: borderRadius,
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
        Positioned.fill(
          child: Material(
            borderRadius: borderRadius,
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
