import 'package:esp_app/common/constants.dart';
import 'package:esp_app/common/widgets/chart_widget.dart';
import 'package:esp_app/common/widgets/scale_widget.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AltitudeView extends StatefulWidget {
  const AltitudeView({Key? key}) : super(key: key);

  @override
  State<AltitudeView> createState() => _AltitudeViewState();
}

class _AltitudeViewState extends State<AltitudeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ESP32 Monitor'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        color: secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Altitude",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            StreamBuilder<double>(
              stream: context.read<WeatherRepository>().altitudes(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Text('${snapshot.data!.toStringAsFixed(2)} m',
                style: TextStyle(color: Colors.white,fontSize: 30),)
                    : Text('0 m',
                    style: TextStyle(color: Colors.white,fontSize: 30));
              },
            ),
            SizedBox(
              height: 500,
              child: StreamBuilder<double>(
                stream: context.read<WeatherRepository>().altitudes(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Chart_Widget(value: snapshot.data!)
                      : const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
