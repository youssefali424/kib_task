import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kib_task/features/history/data/models/history_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/di/history_di.dart';

class HistoryChart extends ConsumerWidget {
  const HistoryChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var list = ref.watch(historyBlocProvider).list;
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(
          maximumLabelWidth: 50,
          plotOffset: 25,
          desiredIntervals: 6,
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          header: "",
          format: "point.y | point.x",
        ),
        series: <LineSeries<HistoryData, String>>[
          LineSeries<HistoryData, String>(
              dataSource: list,
              markerSettings: const MarkerSettings(
                isVisible: true,
              ),
              xValueMapper: (data, _) =>
                  DateFormat('MMM-dd').format(data.date ?? DateTime.now()),
              yValueMapper: (data, _) => data.entries?.isNotEmpty ?? false
                  ? data.entries!.values.first
                  : 0)
        ]);
  }
}
