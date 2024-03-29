import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/core/di/di.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart';
import 'package:spending/presentation/screens/home/bloc/home_bloc.dart';
import 'package:spending/presentation/screens/login/bloc/login_bloc.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_bloc.dart';
import 'package:spending/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:spending/presentation/screens/splash/splash_screen.dart';
import 'package:spending/presentation/screens/sync/bloc/sync_bloc.dart';

import 'core/theme/custom_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  BlocProvider<T> _provider<T extends Bloc>(T bloc) {
    return BlocProvider(create: (context) => bloc);
  }

  @override
  Widget build(BuildContext context) {
    final theme = getIt<CustomTheme>().light;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: theme.scaffoldBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MultiBlocProvider(
      providers: [
        _provider(getIt<SplashBloc>()),
        _provider(getIt<LoginBloc>()),
        _provider(getIt<HomeBloc>()),
        _provider(getIt<ConnectionBloc>()),
        _provider(getIt<SyncBloc>()),
        _provider(getIt<SpendingBloc>()),
      ],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
