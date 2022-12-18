import 'package:esp_app/Component/Constant.dart';
import 'package:flutter/cupertino.dart';

class Altitude extends StatefulWidget {
  const Altitude({Key? key}) : super(key: key);

  @override
  State<Altitude> createState() => _AltitudeState();
}

class _AltitudeState extends State<Altitude> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimaryColor,
      child: Center(
        child: Text("Altitude"),
      ),
    );
  }
}
