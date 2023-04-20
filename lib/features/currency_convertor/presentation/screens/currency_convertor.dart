import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kib_task/core/language/index.dart';
import 'package:kib_task/features/base/presentation/widgets/app_loader.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currency_converter_state.dart';
import 'package:kib_task/features/currency_convertor/presentation/bloc/currency_convertor_bloc.dart';

import '../../../../core/di/currency_conversion_di.dart';
import '../../../base/presentation/widgets/screen_handler.dart';
import '../widgets/currency_text_field.dart';
import 'currencies_bottom_sheet.dart';

class CurrencyConvertorPage extends StatelessWidget {
  static const routeName = '/currency_convertor';

  const CurrencyConvertorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        currencyConvertorBlocProvider.overrideWith(
          (ref) => CurrencyConvertorBloc(
            ref.watch(getCurrencyConversionProvider),
            ref.watch(getCurrenciesProvider),
            ref.watch(getLocalCurrenciesProvider),
            ref.watch(saveCurrenciesProvider),
          ),
        )
      ],
      child: const CurrencyConvertorScreen(),
    );
  }
}

class CurrencyConvertorScreen extends ConsumerStatefulWidget {
  const CurrencyConvertorScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CurrencyConvertorScreen> createState() =>
      _CurrencyConvertorScreenState();
}

class _CurrencyConvertorScreenState
    extends ConsumerState<CurrencyConvertorScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(currencyConvertorBlocProvider.bloc)
          .add(const LoadCurrenciesEvent());
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = ref.watch(currencyConvertorBlocProvider.bloc);

    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.appName),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var isLoading = ref.watch(
              currencyConvertorBlocProvider.select((value) => value.isLoading));

          var from = ref.watch(
              currencyConvertorBlocProvider.select((value) => value.from));
          var to = ref
              .watch(currencyConvertorBlocProvider.select((value) => value.to));
          if (isLoading && from == null && to == null) {
            return const AppLoader(
              isLoading: true,
            );
          }
          ref.listen(
              currencyConvertorBlocProvider.select(
                  (value) => value.converstionAmount), (_, converstionAmount) {
            if (converstionAmount != null) {
              var converstionAmountString =
                  converstionAmount.toStringAsFixed(5);
              int length = 0;
              if (converstionAmountString.contains(".")) {
                length =
                    converstionAmountString.split('.')[1].substring(0).length;
              }
              var formatter = CurrencyTextInputFormatter(
                symbol: '${to?.symbol ?? ""} ',
                name: to?.name,
                decimalDigits: length,
              );
              controller.text = formatter.format(converstionAmountString);
            }
          });
          return ScreenHandler(
            provider: currencyConvertorBlocProvider,
            onRetry: () {
              bloc.add(const LoadCurrenciesEvent());
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CurrencyTextField(
                    currency: from,
                    label: Translations.convertFrom,
                    onChanged: (value) {
                      bloc.add(OnAmountChangedEvent(amount: value));
                    },
                    onOpenCurrencyList: () {
                      _showFromCurrencies(context, from);
                    },
                  ),
                  const SizedBox(height: 30),
                  CurrencyTextField(
                    currency: to,
                    enabled: false,
                    controller: controller,
                    label: Translations.convertTo,
                    onOpenCurrencyList: () {
                      _showToCurrencies(context, to);
                    },
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(const CurrencyConvertorEvent());
                    },
                    child: Text(Translations.convert),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<Currency?> openCurrenciesList(
      BuildContext context, Currency? currency) async {
    return await showModalBottomSheet<Currency?>(
      context: context,
      isScrollControlled: true,
      // backgroundColor: Colors.transparent,
      builder: (context) => CurrenciesBottomSheet(selectedCurrency: currency),
      // backgroundColor: Colors.grey.withOpacity(0.3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
    // var response = await controller.closed;
    // return response;
  }

  void _showFromCurrencies(BuildContext context, Currency? currency) async {
    var selected = await openCurrenciesList(context, currency);
    if (selected is Currency) {
      ref
          .read(currencyConvertorBlocProvider.bloc)
          .add(ReplaceCurrencyEvent(from: selected));
    }
  }

  void _showToCurrencies(BuildContext context, Currency? currency) async {
    var selected = await openCurrenciesList(context, currency);
    if (selected is Currency) {
      ref
          .read(currencyConvertorBlocProvider.bloc)
          .add(ReplaceCurrencyEvent(to: selected));
    }
  }
}
