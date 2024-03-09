import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/core/di/di.dart';
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:spending/presentation/screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  BlocProvider<T> _provider<T extends Bloc>(T bloc) {
    return BlocProvider(create: (context) => bloc);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        _provider(getIt<SplashBloc>()),
        _provider(getIt<LoginBloc>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
