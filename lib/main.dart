import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esp_app/app/app.dart';
import 'package:esp_app/models/model.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:workmanager/workmanager.dart';

import 'common/common.dart';

@pragma('vm:entry-point')
void backgroundDispatcher() async {
  Workmanager().executeTask((taskName, inputData) async {
    try {
      Logger().d('stareted background task: $taskName');
      await Firebase.initializeApp();
      var firestore = FirebaseFirestore.instance.collection('history');
      var database = FirebaseDatabase.instance.ref().child('ESP32_APP');
      await for (var event in database.onValue) {
        var record = CSVRowModel.fromJson(event.snapshot.value as Map);
        await firestore.add(record.toJson());
      }
    } catch (err, st) {
      Logger().e(err, st);
      return false;
    }
    return true;
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();
  var database = FirebaseDatabase.instance.ref().child('ESP32_APP');
  final firestore = FirebaseFirestore.instance;
  final firebaseRepository = WeatherRepository(
    firebaseDatabase: database,
    firebaseFirestore: firestore,
  );

  await Workmanager().initialize(backgroundDispatcher, isInDebugMode: true);
  await Workmanager().registerOneOffTask(
    '1',
    'update firestore record',
    constraints: Constraints(networkType: NetworkType.connected),
  );

  runApp(
    RepositoryProvider.value(
      value: firebaseRepository,
      child: const AppPage(),
    ),
  );
}
