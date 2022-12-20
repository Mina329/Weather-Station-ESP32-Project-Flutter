import 'package:email_validator/email_validator.dart';
import 'package:esp_app/common/common.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../common/widgets/reusable_card.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int tempMinValue = -40;
  int tempMaxValue = 40;
  int humiMinValue = 30;
  int humiMaxValue = 90;
  int altMinValue = -49;
  int altMaxValue = 49;
  int presMinValue = 900;
  int presMaxValue = 1300;
  String email = "minaemil329@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ESP32 Monitor'),
        backgroundColor: Constants.primaryColor,
      ),
      drawer: const AppDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Constants.secondaryColor,
        child: ListView(
          children: [
            StreamBuilder<Map<String, int>>(
              stream: context.read<WeatherRepository>().minmaxTemp(),
              builder: (context, snapshot) {
                tempMinValue = snapshot.data!["minTempVal"]!;
                tempMaxValue = snapshot.data!["maxTempVal"]!;
                return snapshot.hasData
                    ? ReusableCard(
                        colour: const Color(0xFF1D1E33),
                        strVal: "Temperature",
                        strlbl: "°C",
                        minValue: snapshot.data!["minTempVal"]!,
                        maxValue: snapshot.data!["maxTempVal"]!,
                        minMinusFunc: () {
                          setState(() {
                            tempMinValue--;
                            context
                                .read<WeatherRepository>()
                                .minTempVal(tempMinValue);
                          });
                        },
                        minPlusFunc: () {
                          setState(() {
                            tempMinValue++;
                            context
                                .read<WeatherRepository>()
                                .minTempVal(tempMinValue);
                          });
                        },
                        maxMinusFunc: () {
                          setState(() {
                            tempMaxValue--;
                            context
                                .read<WeatherRepository>()
                                .maxTempVal(tempMaxValue);
                          });
                        },
                        maxPlusFunc: () {
                          setState(() {
                            tempMaxValue++;
                            context
                                .read<WeatherRepository>()
                                .maxTempVal(tempMaxValue);
                          });
                        },
                      )
                    : const CircularProgressIndicator();
              },
            ),
            ReusableCard(
              colour: const Color(0xFF1D1E33),
              strVal: "Humidity",
              strlbl: "%",
              minValue: humiMinValue,
              maxValue: humiMaxValue,
              minMinusFunc: () {
                setState(() {
                  humiMinValue--;
                  context.read<WeatherRepository>().minHumiVal(humiMinValue);
                });
              },
              minPlusFunc: () {
                setState(() {
                  humiMinValue++;
                  context.read<WeatherRepository>().minHumiVal(humiMinValue);
                });
              },
              maxMinusFunc: () {
                setState(() {
                  humiMaxValue--;
                  context.read<WeatherRepository>().maxHumiVal(humiMaxValue);
                });
              },
              maxPlusFunc: () {
                setState(() {
                  humiMaxValue++;
                  context.read<WeatherRepository>().maxHumiVal(humiMaxValue);
                });
              },
            ),
            ReusableCard(
              colour: const Color(0xFF1D1E33),
              strVal: "Altitude",
              strlbl: "m",
              minValue: altMinValue,
              maxValue: altMaxValue,
              minMinusFunc: () {
                setState(() {
                  altMinValue--;
                  context.read<WeatherRepository>().minAltVal(altMinValue);
                });
              },
              minPlusFunc: () {
                setState(() {
                  altMinValue++;
                  context.read<WeatherRepository>().minAltVal(altMinValue);
                });
              },
              maxMinusFunc: () {
                setState(() {
                  altMaxValue--;
                  context.read<WeatherRepository>().maxAltVal(altMaxValue);
                });
              },
              maxPlusFunc: () {
                setState(() {
                  altMaxValue++;
                  context.read<WeatherRepository>().maxAltVal(altMaxValue);
                });
              },
            ),
            ReusableCard(
              colour: const Color(0xFF1D1E33),
              strVal: "Air Pressure",
              strlbl: "hPa",
              minValue: presMinValue,
              maxValue: presMaxValue,
              minMinusFunc: () {
                setState(() {
                  presMinValue--;
                  context.read<WeatherRepository>().minPresVal(presMinValue);
                });
              },
              minPlusFunc: () {
                setState(() {
                  presMinValue++;
                  context.read<WeatherRepository>().minPresVal(presMinValue);
                });
              },
              maxMinusFunc: () {
                setState(() {
                  presMaxValue--;
                  context.read<WeatherRepository>().maxPresVal(presMaxValue);
                });
              },
              maxPlusFunc: () {
                setState(() {
                  presMaxValue++;
                  context.read<WeatherRepository>().maxPresVal(presMaxValue);
                });
              },
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(fontSize: 40, color: Color(0xFF8D8E98)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (text) {
                        email = text;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MaterialButton(
                      color: const Color(0xFF8D8E98),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      onPressed: () {
                        bool isvalid = EmailValidator.validate(email);
                        isvalid
                            ? context.read<WeatherRepository>().setEmail(
                                email == "" ? "minaemil329@gmail.com" : email)
                            : showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text("Alert"),
                                  content: const Text("Email is not Valid ."),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Note : Email Notification will be \nturned off after an Email is sent .',
                          style: TextStyle(
                            color: const Color(0xFF8D8E98),
                          ),
                        ),
                        StreamBuilder(
                          stream: context.read<WeatherRepository>().emailSent(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? ToggleSwitch(
                                    minWidth: 50.0,
                                    cornerRadius: 20.0,
                                    activeBgColors: [
                                      [Colors.green[800]!],
                                      [Colors.red[800]!]
                                    ],
                                    activeFgColor: Colors.white,
                                    inactiveBgColor: Colors.grey,
                                    inactiveFgColor: Colors.white,
                                    initialLabelIndex:
                                        snapshot.data!.toLowerCase() == "true"
                                            ? 0
                                            : 1,
                                    totalSwitches: 2,
                                    labels: ['ON', 'OFF'],
                                    radiusStyle: true,
                                    onToggle: (index) {
                                      index == 0
                                          ? context
                                              .read<WeatherRepository>()
                                              .setEmailSent("true")
                                          : context
                                              .read<WeatherRepository>()
                                              .setEmailSent("false");
                                    },
                                  )
                                : const CircularProgressIndicator();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
