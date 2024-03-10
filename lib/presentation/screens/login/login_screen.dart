import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spending/core/constants/image_asset_path.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_event.dart';
import 'package:spending/presentation/screens/home/bloc/home_event.dart';
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart';
import 'package:spending/presentation/screens/login/bloc/login_event.dart';
import 'package:spending/presentation/screens/login/bloc/login_state.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_event.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ConnectionBloc>().add(ConnectionSetContext(context: context));
    final bloc = context.read<LoginBloc>();

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  ImageAssetPath.monkey,
                ),
              ),
              const Text(
                'Spending',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Smart application to track monthly expenses finances',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) {
                  return previous.status != current.status;
                },
                builder: (context, state) {
                  Widget widget = ElevatedButton.icon(
                    onPressed: () {
                      bloc.add(LoginSignInWithGoogle(context: context));
                    },
                    label: const Text('SIGN IN WITH GOOGLE'),
                    icon: const FaIcon(FontAwesomeIcons.google),
                  );

                  if (state.status == Status.loading) {
                    return const CircularProgressIndicator();
                  }

                  return widget;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
