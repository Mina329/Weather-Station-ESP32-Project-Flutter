import 'package:esp_app/Component/Constant.dart';
import 'package:esp_app/Component/Scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Temprature extends StatefulWidget {

  const Temprature({Key? key}) : super(key: key);

  @override
  State<Temprature> createState() => _TempratureState();
}

class _TempratureState extends State<Temprature> {

  @override


  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Temprature",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          Scale(50, -40, 85, "°C",10),
        ],
      ),
    );
  }
  }

