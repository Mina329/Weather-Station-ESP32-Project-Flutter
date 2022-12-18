import 'package:esp_app/common/common.dart';
import 'package:esp_app/common/constants.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: Container(
        color: primaryColor,
        child: const Center(
          child: Text("about"),
        ),
      ),
    );
  }
}
