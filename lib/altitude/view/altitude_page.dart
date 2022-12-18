import 'package:flutter/material.dart';

import 'altitude_view.dart';

class AltitudePage extends StatelessWidget {
  const AltitudePage({super.key});

  static route() =>
      MaterialPageRoute(builder: ((context) => const AltitudePage()));

  @override
  Widget build(BuildContext context) {
    return const AltitudeView();
  }
}
