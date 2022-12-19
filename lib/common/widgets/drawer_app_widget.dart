import 'package:avatar_glow/avatar_glow.dart';
import 'package:esp_app/common/common.dart';
import 'package:esp_app/humidity/humidity.dart';
import 'package:esp_app/pressure/pressure.dart';
import 'package:esp_app/about/about.dart';
import 'package:esp_app/temperature/temperature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../altitude/view/altitude_page.dart';
import '../../repositories/weather_repository.dart';
import '../../settings/view/settings_page.dart';

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
            title: "Altitude",
            icon: Icons.height,
            route: AltitudePage.route(),
          ),
          DrawerItem(
            title: "Air Pressure",
            icon: WeatherIcons.barometer,
            route: PressurePage.route(),
          ),
          DrawerItem(
            title: "Settings",
            icon: Icons.settings,
            route: SettingsPage.route(),
          ),
          DrawerItem(
            title: "About",
            icon: Icons.info,
            route: AboutPage.route(),
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
      color: Constants.secondaryColor,
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StreamBuilder<String>(
              stream: context.read<WeatherRepository>().time(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? AvatarGlow(
                        glowColor: snapshot.data! == 'Day'
                            ? Colors.orange
                            : Colors.blue,
                        endRadius: 70.0,
                        duration: const Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        child: Material(
                          // Replace this child with your own
                          elevation: 8.0,
                          shape: const CircleBorder(),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage(
                              snapshot.data! == 'Day'
                                  ? 'images/0.jpg'
                                  : 'images/1.jpg',
                            ),
                          ),
                        ),
                      )
                    : const CircularProgressIndicator();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Welcome ",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                StreamBuilder<double>(
                  stream: context.read<WeatherRepository>().alert(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Icon(
                            snapshot.data! == 0
                                ? Icons.safety_check
                                : Icons.dangerous,
                            color:
                                snapshot.data! == 0 ? Colors.green : Colors.red,
                          )
                        : const Icon(Icons.safety_check, color: Colors.white);
                  },
                ),
              ],
            ),
          ],
        ),
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
                  color: Constants.textColor,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style:
                      const TextStyle(color: Constants.textColor, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
