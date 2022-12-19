import 'package:esp_app/app/app.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  final firebaseRepository =
      WeatherRepository(FirebaseDatabase.instance.ref().child('ESP32_APP'));

  await Firebase.initializeApp();
  runApp(
    RepositoryProvider.value(
      value: firebaseRepository,
      child: const AppPage(),
    ),
  );
}
