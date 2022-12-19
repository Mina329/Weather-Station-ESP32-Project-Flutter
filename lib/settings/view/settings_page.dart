import 'package:flutter/material.dart';

import 'settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static route() =>
      MaterialPageRoute(builder: ((context) => const SettingsPage()));

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}
