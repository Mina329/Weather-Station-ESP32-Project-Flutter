import 'package:email_validator/email_validator.dart';
import 'package:esp_app/common/common.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/reusable_card.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

  int tempMinValue =-30 ;
  int tempMaxValue = 50;
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
        backgroundColor: primaryColor,
      ),
      drawer: const AppDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: secondaryColor,
        child: ListView(
          children: [

            ReusableCard(
              colour: const Color(0xFF1D1E33),
              strVal: "Temperature",
              strlbl: "°C",
              minValue: tempMinValue,
              maxValue: tempMaxValue,
              minMinusFunc: () {
                setState(() {
                  tempMinValue--;
                  context.read<WeatherRepository>().minTempVal(tempMinValue);
                });
              },
              minPlusFunc: () {
                setState(() {
                  tempMinValue++;
                  context.read<WeatherRepository>().minTempVal(tempMinValue);
                });
              },
              maxMinusFunc: () {
                setState(() {
                  tempMaxValue--;
                  context.read<WeatherRepository>().maxTempVal(tempMaxValue);
                });
              },
              maxPlusFunc: () {
                setState(() {
                  tempMaxValue++;
                  context.read<WeatherRepository>().maxTempVal(tempMaxValue);
                });
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
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 40, color: Color(0xFF8D8E98)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      style: TextStyle(
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
                      color: Color(0xFF8D8E98),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
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
                    )
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
