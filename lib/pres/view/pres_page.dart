import 'package:flutter/material.dart';

import 'pres_view.dart';

class PresPage extends StatelessWidget {
  const PresPage({super.key});

  static route() => MaterialPageRoute(builder: ((context) => const PresPage()));

  @override
  Widget build(BuildContext context) {
    return const PresView();
  }
}
