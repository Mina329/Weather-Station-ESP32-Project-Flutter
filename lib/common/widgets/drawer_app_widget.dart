import 'package:esp_app/common/common.dart';
import 'package:esp_app/humidity/humidity.dart';
import 'package:esp_app/pressure/pressure.dart';
import 'package:esp_app/temperature/temperature.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [const Header(), pagesList()],
        ),
      ),
    );
  }

  Widget pagesList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          DrawerItem(
            title: "Temprature",
            icon: WeatherIcons.thermometer,
            route: TemperaturePage.route(),
          ),
          DrawerItem(
            title: "Humidity",
            icon: WeatherIcons.humidity,
            route: HumidityPage.route(),
          ),
          DrawerItem(
            title: "Air Pressure",
            icon: WeatherIcons.barometer,
            route: PressurePage.route(),
          ),
        ],
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final MaterialPageRoute route;
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Scaffold.of(context).closeDrawer();
          Navigator.of(context).popUntil((route) => route.settings.name == '/');
          Navigator.of(context).push(route);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: textColor,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(color: textColor, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
