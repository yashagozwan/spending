import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_bloc.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_event.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_state.dart';

class SpendingScreen extends StatefulWidget {
  const SpendingScreen({super.key});

  @override
  State<SpendingScreen> createState() => _SpendingScreenState();
}

class _SpendingScreenState extends State<SpendingScreen> {
  late final SpendingBloc _bloc;

  void _initial() async {
    _bloc = context.read<SpendingBloc>()..add(const SpendingStarted());
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        title: BlocBuilder<SpendingBloc, SpendingState>(
          builder: (context, state) {
            return Text(state.spending.title);
          },
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
