import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart';
import 'package:spending/presentation/screens/login/bloc/login_event.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<LoginBloc>().add(const LoginSignInWithGoogle());
              },
              child: const Text('Sign In With Google'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
