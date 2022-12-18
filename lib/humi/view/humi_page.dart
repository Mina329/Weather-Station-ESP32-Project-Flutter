import 'package:esp_app/humi/view/view.dart';
import 'package:flutter/material.dart';

class HumiPage extends StatelessWidget {
  const HumiPage({super.key});

  static route() => MaterialPageRoute(builder: ((context) => const HumiPage()));

  @override
  Widget build(BuildContext context) {
    return const HumiView();
  }
}
