import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
class realtime extends StatefulWidget {
  const realtime({Key? key}) : super(key: key);

  @override
  State<realtime> createState() => _realtimeState();
}

class _realtimeState extends State<realtime> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  DatabaseReference starCountRef = FirebaseDatabase.instance.ref('ESP32_App');

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
