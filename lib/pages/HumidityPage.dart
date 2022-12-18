import 'package:esp_app/Component/Constant.dart';
import 'package:esp_app/Component/Scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Humidity extends StatefulWidget {
  const Humidity({Key? key}) : super(key: key);

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Humidity",
              style: TextStyle(color: Colors.white,fontSize: 50)),

          Scale(60, 0, 100, "%",10),
        ],
      ),
    );
  }
}
