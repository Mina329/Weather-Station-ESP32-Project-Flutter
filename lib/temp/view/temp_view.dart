import 'package:esp_app/common/common.dart';
import 'package:esp_app/Component/Scale.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TempView extends StatefulWidget {
  const TempView({Key? key}) : super(key: key);

  @override
  State<TempView> createState() => _TempViewState();
}

class _TempViewState extends State<TempView> {
  @override
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
            const Text(
              "Temprature",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
            StreamBuilder<double>(
              stream: context.read<WeatherRepository>().temperatures(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Scale(snapshot.data!, -40, 85, "°C", 10)
                    : const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
