import 'package:firebase_database/firebase_database.dart';

class WeatherRepository {
  final DatabaseReference firebaseDatabase;

  WeatherRepository(this.firebaseDatabase);

  Stream<double> temperatures() {
    return firebaseDatabase.onValue
        .map((event) => event.snapshot.child('TEMPERATURE').value.toString())
        .map(double.parse);
  }

  Stream<double> humidities() {
    return firebaseDatabase.onValue
        .map((event) => event.snapshot.child('HUMIDITY').value.toString())
        .map(double.parse);
  }

  Stream<double> altitudes() {
    return firebaseDatabase.onValue
        .map((event) => event.snapshot.child('ALTITUDE').value.toString())
        .map(double.parse);
  }

  Stream<double> pressures() {
    return firebaseDatabase.onValue
        .map((event) => event.snapshot.child('PRESSURE').value.toString())
        .map(double.parse);
  }
}
