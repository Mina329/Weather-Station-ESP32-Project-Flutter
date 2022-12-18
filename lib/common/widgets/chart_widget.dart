import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart_Widget extends StatefulWidget {
  const Chart_Widget({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  State<Chart_Widget> createState() => _Chart_WidgetState(value);
}

class _Chart_WidgetState extends State<Chart_Widget> {
  _Chart_WidgetState(this.value);

  final double value;
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
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
    chartData.remove(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SfCartesianChart(
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: -50,
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
      ),
    );
  }
}

class LiveData {
  final int time;
  final num height;

  LiveData(this.time, this.height);
}
