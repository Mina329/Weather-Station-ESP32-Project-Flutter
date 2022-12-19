import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  State<ChartWidget> createState() => _ChartWidgetState(value);
}

class _ChartWidgetState extends State<ChartWidget> {
  _ChartWidgetState(this.value);

  final double value;
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 2), updateDataSource);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, value),
      LiveData(1, value),
      LiveData(2, value),
      LiveData(3, value),
    ];
  }

  int time = 4;

  updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, value));
    if (chartData.isNotEmpty) {
      chartData.removeAt(0);
    }
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        primaryYAxis: NumericAxis(
          minimum: -50,
          maximum: 50,
        ),
        series: [
          LineSeries<LiveData, int>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            xValueMapper: (LiveData data, _) => data.time,
            yValueMapper: (LiveData data, _) => data.height,
          )
        ],
      ),
    );
  }
}

class LiveData {
  final int time;
  final num height;

  LiveData(this.time, this.height);
}
