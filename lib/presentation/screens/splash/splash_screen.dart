import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/core/constants/image_asset_path.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_event.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_event.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ConnectionBloc>().add(ConnectionInitial(context: context));
    context.read<SplashBloc>().add(SplashStarted(context: context));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                ImageAssetPath.hourglass,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please Wait',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
