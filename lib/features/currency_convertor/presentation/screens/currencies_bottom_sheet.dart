import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currencies_bottom_sheet_bloc.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currency_converter_state.dart';

import '../../../../core/di/currency_conversion_di.dart';
import '../../../base/presentation/widgets/screen_handler.dart';
import '../widgets/currency_image.dart';

class CurrenciesBottomSheet extends StatelessWidget {
  final Currency? selectedCurrency;
  const CurrenciesBottomSheet({
    Key? key,
    this.selectedCurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        currenciesBottomSheetBlocProvider.overrideWith(
          (ref) => CurrenciesBottomSheetBloc(
            ref.watch(getCurrenciesProvider),
            ref.watch(getLocalCurrenciesProvider),
            ref.watch(saveCurrenciesProvider),
            selected: selectedCurrency,
          )..add(const LoadCurrenciesEvent()),
        )
      ],
      child: const _CurrenciesBottomSheet(),
    );
  }
}

class _CurrenciesBottomSheet extends ConsumerWidget {
  const _CurrenciesBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        var theme = Theme.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                var state = ref.watch(currenciesBottomSheetBlocProvider);
                var currencies = state.currencies;
                var selectedCurrency = state.selectedCurrency;
                return ScreenHandler(
                  fit: StackFit.loose,
                  provider: currenciesBottomSheetBlocProvider,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      var item = currencies[index];
                      var isSelected = selectedCurrency?.code == item.code;

                      return ListTile(
                        selected: isSelected,
                        leading: CurrencyImage(
                          code: item.code,
                        ),
                        title: Text(
                          item.code,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        subtitle: Text(
                          item.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: isSelected ? const Icon(Icons.check) : null,
                        onTap: () {
                          Navigator.pop(context, item);
                        },
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
