import 'package:esp_app/humidity/view/view.dart';
import 'package:flutter/material.dart';

class HumidityPage extends StatelessWidget {
  const HumidityPage({super.key});

  static route() =>
      MaterialPageRoute(builder: ((context) => const HumidityPage()));

  @override
  Widget build(BuildContext context) {
    return const HumidityView();
  }
}
