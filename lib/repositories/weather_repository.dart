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

  void minTempVal(int value) async {
    await firebaseDatabase.update({'minTempVal': value});
  }

  void maxTempVal(int value) async {
    await firebaseDatabase.update({'maxTempVal': value});
  }

  void minHumiVal(int value) async {
    await firebaseDatabase.update({'minHumiVal': value});
  }

  void maxHumiVal(int value) async {
    await firebaseDatabase.update({'maxHumiVal': value});
  }

  void minAltVal(int value) async {
    await firebaseDatabase.update({'minAltVal': value});
  }

  void maxAltVal(int value) async {
    await firebaseDatabase.update({'maxAltVal': value});
  }

  void minPresVal(int value) async {
    await firebaseDatabase.update({'minPresVal': value});
  }

  void maxPresVal(int value) async {
    await firebaseDatabase.update({'maxPresVal': value});
  }

  void setEmail(String value) async {
    await firebaseDatabase.update({'Email': value});
  }

}
