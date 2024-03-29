import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spending/data/sources/local/floor/database_floor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Logger get logger => Logger();

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FlutterLocalNotificationsPlugin get flutterNotificationsPlugin {
    return FlutterLocalNotificationsPlugin();
  }

  @preResolve
  Future<DatabaseFloor> get databaseFloor {
    return $FloorDatabaseFloor.databaseBuilder('database_v4.db').build();
  }

  @lazySingleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  TextEditingController get textEditingController => TextEditingController();
}
