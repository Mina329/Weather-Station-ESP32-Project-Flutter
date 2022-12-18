import 'package:esp_app/Component/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Component/Scale.dart';


class AirPressure extends StatefulWidget {
  const AirPressure({Key? key}) : super(key: key);

  @override
  State<AirPressure> createState() => _AirPressureState();
}

class _AirPressureState extends State<AirPressure> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Air Pressure",
              style: TextStyle(color: Colors.white,fontSize: 50)),

          Scale(1118, 800, 1300, "hPa",50),
        ],
      ),
    );
  }
}
