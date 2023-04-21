import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kib_task/core/di/history_di.dart';
import 'package:kib_task/core/language/index.dart';
import 'package:kib_task/features/base/presentation/widgets/screen_handler.dart';
import 'package:kib_task/features/history/presentation/bloc/history_bloc.dart';
import 'package:kib_task/features/history/presentation/bloc/history_state.dart';

import '../widgets/history_chart.dart';
import '../widgets/history_list.dart';

class HistoryScreen extends StatelessWidget {
  static const routeName = '/history';
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        historyBlocProvider.overrideWith(
          (ref) => HistoryBloc(ref.watch(getHistoricalDataProvider))
            ..add(const LoadHistoricalDataEvent()),
        )
      ],
      child: const _HistoryPage(),
    );
  }
}

class _HistoryPage extends StatelessWidget {
  const _HistoryPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.history),
      ),
      body: ScreenHandler(
        provider: historyBlocProvider,
        child: Column(
          children: [
            Expanded(
                child: Consumer(
                    child: const HistoryList(),
                    builder: (context, ref, child) {
                      var showChart = ref.watch(historyBlocProvider).showChart;
                      if (showChart) {
                        return const Center(child: HistoryChart());
                      }
                      return child!;
                    })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Consumer(builder: (context, ref, _) {
                      var showChart = ref.watch(historyBlocProvider).showChart;
                      return ElevatedButton(
                          onPressed: () {
                            ref
                                .read(historyBlocProvider.bloc)
                                .add(ShowChartEvent(show: !showChart));
                          },
                          child: Text(showChart
                              ? Translations.showList
                              : Translations.chart));
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
