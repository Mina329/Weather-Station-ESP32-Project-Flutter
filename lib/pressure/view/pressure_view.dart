import 'package:esp_app/common/common.dart';
import 'package:esp_app/common/widgets/scale_widget.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PressureView extends StatefulWidget {
  const PressureView({Key? key}) : super(key: key);

  @override
  State<PressureView> createState() => _PressureViewState();
}

class _PressureViewState extends State<PressureView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ESP32 Monitor'),
        backgroundColor: primaryColor,
      ),
      drawer: const AppDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Air Pressure",
                style: TextStyle(color: Colors.white, fontSize: 50)),
            StreamBuilder<double>(
              stream: context.read<WeatherRepository>().pressures(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ScaleWidget(snapshot.data!, 800, 1300, "hPa", 50)
                    : CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
