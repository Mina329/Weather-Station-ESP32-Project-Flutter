import 'package:esp_app/common/common.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ESP32 Monitor"),
      ),
      body: Container(),
      drawer: const AppDrawer(),
    );
  }
}
