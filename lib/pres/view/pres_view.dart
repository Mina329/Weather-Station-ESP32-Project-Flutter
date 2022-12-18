import 'package:esp_app/common/common.dart';
import 'package:esp_app/common/constants.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Component/Scale.dart';

class PresView extends StatefulWidget {
  const PresView({Key? key}) : super(key: key);

  @override
  State<PresView> createState() => _PresViewState();
}

class _PresViewState extends State<PresView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: Container(
        color: primaryColor,
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
                    ? Scale(snapshot.data!, 800, 1300, "hPa", 50)
                    : const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
