import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/presentation/screens/login/login_screen.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashBloc _bloc;

  void _initial() async {
    _bloc = context.read<SplashBloc>();
    _bloc.add(SplashStarted(context: context));
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const LoginScreen();
              },
            ));
          },
          child: const Text('Goto Login'),
        ),
      ),
    );
  }
}
