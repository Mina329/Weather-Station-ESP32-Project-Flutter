import 'package:esp_app/common/common.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: Container(
        color: primaryColor,
        child: const Center(
          child: Text("setting"),
        ),
      ),
    );
  }
}
