import 'package:esp_app/Component/Constant.dart';
import 'package:esp_app/pages/AboutPage.dart';
import 'package:esp_app/pages/AltitudePage.dart';
import 'package:esp_app/pages/HumidityPage.dart';
import 'package:esp_app/pages/SettingPage.dart';
import 'package:esp_app/pages/TempraturePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Component/Header.dart';
import 'AirPressurePage.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = Drawerenum.temprature;

  final ref = FirebaseDatabase.instance.reference();
  late double temp , humi,alt,pres;

  @override
  void initState() {
    super.initState();
    ref.child('ESP32_APP').onValue.listen((DatabaseEvent event) {
      temp = double.parse(event.snapshot.child('TEMPERATURE').value.toString());
      humi = double.parse(event.snapshot.child('HUMIDITY').value.toString());
      alt = double.parse(event.snapshot.child('ALTITUDE').value.toString());
      pres = double.parse(event.snapshot.child('PRESSURE').value.toString());
      print("$temp  $humi  $alt  $pres");
    });
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == Drawerenum.temprature) {
      container = Temprature();
    } else if (currentPage == Drawerenum.humdity) {
      container = Humidity();
    } else if (currentPage == Drawerenum.altitude) {
      container = Altitude();
    } else if (currentPage == Drawerenum.pressure) {
      container = AirPressure();
    } else if (currentPage == Drawerenum.setting) {
      container = Setting();
    } else if (currentPage == Drawerenum.about) {
      container = About();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: const Text("ESP32 Monitor"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Header(),
                List(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget List() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Temprature", WeatherIcons.thermometer,
              currentPage == Drawerenum.temprature ? true : false),
          menuItem(2, "Humidity", WeatherIcons.humidity,
              currentPage == Drawerenum.humdity ? true : false),
          menuItem(3, "Altitude", Icons.height,
              currentPage == Drawerenum.altitude ? true : false),
          menuItem(4, "Air Pressure", WeatherIcons.barometer,
              currentPage == Drawerenum.pressure ? true : false),
          menuItem(5, "Settings", Icons.settings,
              currentPage == Drawerenum.setting ? true : false),
          menuItem(6, "About", Icons.info,
              currentPage == Drawerenum.about ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = Drawerenum.temprature;
            } else if (id == 2) {
              currentPage = Drawerenum.humdity;
            } else if (id == 3) {
              currentPage = Drawerenum.altitude;
            } else if (id == 4) {
              currentPage = Drawerenum.pressure;
            } else if (id == 5) {
              currentPage = Drawerenum.setting;
            } else if (id == 6) {
              currentPage = Drawerenum.about;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: TextColor,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: TextColor, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Drawerenum {
  temprature,
  humdity,
  altitude,
  pressure,
  setting,
  about,
}
