import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kib_task/core/di/history_di.dart';
import 'package:kib_task/features/currency_convertor/presentation/widgets/currency_image.dart';

class HistoryList extends ConsumerWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var list = ref.watch(historyBlocProvider).list;
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          var item = list[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: ListTile(
                leading: Row(mainAxisSize: MainAxisSize.min, children: const [
                  CurrencyImage(code: "USD"),
                  SizedBox(width: 10),
                  Text("USD"),
                ]),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (item.date != null)
                      Text(DateFormat('yyyy-MM-dd').format(item.date!)),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  if (item.entries?.isNotEmpty ?? false)
                    Text(item.entries!.values.first.toString()),
                  const SizedBox(width: 10),
                  const CurrencyImage(code: "EUR"),
                ]),
              ),
            ),
          );
        });
  }
}
