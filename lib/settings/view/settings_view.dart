import 'dart:io';

import 'package:csv/csv.dart';
import 'package:email_validator/email_validator.dart';
import 'package:esp_app/common/common.dart';
import 'package:esp_app/models/csv_model.dart';
import 'package:esp_app/models/settings_model.dart';
import 'package:esp_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../common/widgets/reusable_card.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';


class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<List<String>> csvList = [];
  String email = "minaemil329@gmail.com";
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => addRow(csvList));
  }

  void addRow(List<List<String>> list) {
    var csv = CSVModel.fromJson(context.read<WeatherRepository>().csv());
    list.add([csv.temp, csv.humi, csv.alt, csv.pres]);
  }

  void generateCSV(List<List<dynamic>> csvList) async {
    List<String> rowHeader = ["TEMPERATURE", "HUMIDITY", "ALTITUDE","AIR PRESSURE"];
    List<List<dynamic>> rows = [];
    rows.add(rowHeader);
    for (int i = 0; i < csvList.length; i++) {
      List<dynamic> dataRow = [];
      dataRow.add(csvList[i][0]);
      dataRow.add(csvList[i][1]);
      dataRow.add(csvList[i][2]);
      dataRow.add(csvList[i][3]);
      rows.add(dataRow);
    }
    await Permission.manageExternalStorage.request();
    bool checkPermission=await Permission.manageExternalStorage.request().isGranted;
    if(checkPermission) {

      Directory downloadDir = Directory('storage/emulated.0/Download');
      final File file = await(File('${downloadDir.path}/esp.csv').create());
      String csvData = ListToCsvConverter().convert(rows);
      await file.writeAsString(csvData);
    }
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ESP32 Monitor'),
        backgroundColor: Constants.primaryColor,
      ),
      drawer: const AppDrawer(),
      body: StreamBuilder<Map<dynamic, dynamic>>(
        stream: context.read<WeatherRepository>().settings(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var settings = SettingsModel.fromJson(snapshot.data!);
          return Container(
            width: MediaQuery.of(context).size.width,
            color: Constants.secondaryColor,
            child: ListView(
              children: [
                ReusableCard(
                  colour: const Color(0xFF1D1E33),
                  strVal: "Temperature",
                  strlbl: "°C",
                  minValue: settings.minTempVal,
                  maxValue: settings.maxTempVal,
                  minChanged: (value) {
                    context.read<WeatherRepository>().minTempVal(value);
                  },
                  maxChanged: (value) {
                    context.read<WeatherRepository>().maxTempVal(value);
                  },
                ),
                ReusableCard(
                  colour: const Color(0xFF1D1E33),
                  strVal: "Humidity",
                  strlbl: "%",
                  minValue: settings.minHumiVal,
                  maxValue: settings.maxHumiVal,
                  minChanged: (value) {
                    context.read<WeatherRepository>().minHumiVal(value);
                  },
                  maxChanged: (value) {
                    context.read<WeatherRepository>().maxHumiVal(value);
                  },
                ),
                ReusableCard(
                    colour: const Color(0xFF1D1E33),
                    strVal: "Altitude",
                    strlbl: "m",
                    minValue: settings.minAltVal,
                    maxValue: settings.maxAltVal,
                    minChanged: (value) {
                      context.read<WeatherRepository>().minAltVal(value);
                    },
                    maxChanged: (value) {
                      context.read<WeatherRepository>().maxAltVal(value);
                    }),
                ReusableCard(
                  colour: const Color(0xFF1D1E33),
                  strVal: "Air Pressure",
                  strlbl: "hPa",
                  minValue: settings.minPresVal,
                  maxValue: settings.maxPresVal,
                  minChanged: (value) {
                    context.read<WeatherRepository>().minPresVal(value);
                  },
                  maxChanged: (value) {
                    context.read<WeatherRepository>().maxPresVal(value);
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
                          style:
                              TextStyle(fontSize: 40, color: Color(0xFF8D8E98)),
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
                                    email == ""
                                        ? "minaemil329@gmail.com"
                                        : email)
                                : showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text("Alert"),
                                      content:
                                          const Text("Email is not Valid ."),
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
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Note : Email Notification will be \nturned off after an Email is sent .',
                              style: TextStyle(
                                color: Color(0xFF8D8E98),
                              ),
                            ),
                            StreamBuilder(
                              stream:
                                  context.read<WeatherRepository>().emailSent(),
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
                                            snapshot.data!.toLowerCase() ==
                                                    "true"
                                                ? 0
                                                : 1,
                                        totalSwitches: 2,
                                        labels: const ['ON', 'OFF'],
                                        onToggle: (index) {
                                          index == 0
                                              ? context
                                                  .read<WeatherRepository>()
                                                  .setEmailSent(true)
                                              : context
                                                  .read<WeatherRepository>()
                                                  .setEmailSent(false);
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
                          "Document",
                          style:
                              TextStyle(fontSize: 40, color: Color(0xFF8D8E98)),
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
                            "Download",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          onPressed: () {
                            generateCSV(csvList);
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
