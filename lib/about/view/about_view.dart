import 'package:esp_app/common/constants.dart';
import 'package:esp_app/common/widgets/chart_widget.dart';
import 'package:esp_app/common/widgets/scale_widget.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
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
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "T050",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "20191700674",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const Text(
                    "مینا امیل فخرى جابر",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "20191700677",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const Text(
                    "مینا سعدالله رزق الله ",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "20191700675",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const Text(
                    "مینا جرجس نصیف بشاي",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "20191700607",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const Text(
                    "محمود محمد احمد عوض",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
