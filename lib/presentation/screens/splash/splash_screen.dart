import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/core/constants/image_asset_path.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_event.dart';
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
    context.read<ConnectionBloc>().add(ConnectionInitial(context: context));
    _bloc = context.read<SplashBloc>();
    _bloc.add(SplashStarted(context: context));
  }

  @override
  void initState() {
    super.initState();
    _initial();
  }

  @override
  void didChangeDependencies() {
    context.read<ConnectionBloc>().add(const ConnectionDestroy());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                ImageAssetPath.authentication,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Authentication',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
