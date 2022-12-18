import 'package:flutter/material.dart';

import 'temp_view.dart';

class TempPage extends StatelessWidget {
  const TempPage({Key? key}) : super(key: key);

  static route() => MaterialPageRoute(builder: ((context) => const TempPage()));

  @override
  Widget build(BuildContext context) {
    return const TempView();
  }
}
