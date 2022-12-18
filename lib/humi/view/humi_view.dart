import 'package:esp_app/common/constants.dart';
import 'package:esp_app/Component/Scale.dart';
import 'package:flutter/material.dart';

class HumiView extends StatefulWidget {
  const HumiView({Key? key}) : super(key: key);

  @override
  State<HumiView> createState() => _HumiViewState();
}

class _HumiViewState extends State<HumiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Humidity",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            Scale(60, 0, 100, "%", 10),
          ],
        ),
      ),
    );
  }
}
