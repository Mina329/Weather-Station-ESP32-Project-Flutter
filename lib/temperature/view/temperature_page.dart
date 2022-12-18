import 'package:flutter/material.dart';

import 'temperature_view.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  static route() =>
      MaterialPageRoute(builder: ((context) => const TemperaturePage()));

  @override
  Widget build(BuildContext context) {
    return const TemperatureView();
  }
}
