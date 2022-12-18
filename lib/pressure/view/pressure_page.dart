import 'package:flutter/material.dart';

import 'pressure_view.dart';

class PressurePage extends StatelessWidget {
  const PressurePage({super.key});

  static route() =>
      MaterialPageRoute(builder: ((context) => const PressurePage()));

  @override
  Widget build(BuildContext context) {
    return const PressureView();
  }
}
