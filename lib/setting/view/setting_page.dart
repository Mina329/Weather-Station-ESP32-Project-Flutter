import 'package:flutter/material.dart';

import 'setting_view.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  static route() =>
      MaterialPageRoute(builder: ((context) => const SettingPage()));

  @override
  Widget build(BuildContext context) {
    return const SettingView();
  }
}
