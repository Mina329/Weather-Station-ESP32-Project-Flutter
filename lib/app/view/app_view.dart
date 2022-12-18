import 'package:esp_app/common/common.dart';
import 'package:esp_app/temperature/temperature.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemperaturePage(),
      drawer: const AppDrawer(),
    );
  }
}
