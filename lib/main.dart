import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spending/app.dart';
import 'package:spending/core/di/di.dart';
import 'package:spending/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(const App());
}
