import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_event.dart';
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart';
import 'package:spending/presentation/screens/home/bloc/home_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ConnectionBloc>().add(ConnectionSetContext(context: context));
    final bloc = context.read<HomeBloc>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('HomeScreen'),
            ElevatedButton(
              onPressed: () {
                bloc.add(HomeLogout(context: context));
              },
              child: const Text(
                'Sign Out',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
