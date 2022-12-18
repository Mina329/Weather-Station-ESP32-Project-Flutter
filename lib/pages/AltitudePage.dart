import 'package:esp_app/common/constants.dart';
import 'package:flutter/material.dart';

class Altitude extends StatefulWidget {
  const Altitude({Key? key}) : super(key: key);

  @override
  State<Altitude> createState() => _AltitudeState();
}

class _AltitudeState extends State<Altitude> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: primaryColor,
        child: const Center(
          child: Text("Altitude"),
        ),
      ),
    );
  }
}
