import 'dart:io';
import 'package:csv/csv.dart';
import 'package:esp_app/models/csv_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

class CsvGenerator {
  static void generateCSV(List<CSVRowModel> csvRows) async {
    List<String> rowHeader = [
      "TEMPERATURE",
      "HUMIDITY",
      "ALTITUDE",
      "AIR PRESSURE"
          "CREATED_AT",
    ];
    List<List<String>> rows = csvRows
        .map((row) => [
              '${row.temp}',
              '${row.humi}',
              '${row.alt}',
              '${row.pres}',
              '${row.createdAt}'
            ])
        .toList();
    rows = [
      rowHeader,
      ...rows,
    ];

    if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }
    if (await Permission.storage.isDenied) {
      await Permission.manageExternalStorage.request();
    }

    if (await Permission.mediaLibrary.isDenied) {
      await Permission.mediaLibrary.request();
    }

    if (await Permission.storage.isDenied ||
        await Permission.manageExternalStorage.isDenied ||
        await Permission.manageExternalStorage.isDenied) {
      return;
    }

    var directory = await FilePicker.platform.getDirectoryPath();
    if (directory != null) {
      var filePath = path.join(directory, 'csv_data.csv');
      var file = await File(filePath).create();
      var csvData = const ListToCsvConverter().convert(rows);
      await file.writeAsString(csvData);
    }
  }
}
