import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kib_task/features/currency_convertor/data/models/currency.dart';

import 'currency_image.dart';

class CurrencyTextField extends StatefulWidget {
  final Currency? currency;
  final Function(String)? onChanged;
  final bool enabled;
  final TextEditingController? controller;
  final Function()? onOpenCurrencyList;
  final String? label;

  const CurrencyTextField({
    super.key,
    this.currency,
    this.onChanged,
    this.enabled = true,
    this.controller,
    this.onOpenCurrencyList,
    this.label,
  });

  @override
  State<CurrencyTextField> createState() => _CurrencyTextFieldState();
}

class _CurrencyTextFieldState extends State<CurrencyTextField> {
  final focusNode = FocusNode();
  final _hasFocus = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      _hasFocus.value = focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var code = widget.currency?.code ?? "";
    var theme = Theme.of(context);
    var symbol = '${widget.currency?.symbol ?? ""} ';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: theme.inputDecorationTheme.labelStyle,
          ),
          const SizedBox(height: 5),
        ],
        ValueListenableBuilder(
          valueListenable: _hasFocus,
          builder: (_, hasFocus, child) => DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.enabled
                    ? hasFocus
                        ? theme.primaryColor
                        : theme.dividerColor
                    : theme.disabledColor,
                width: widget.enabled && hasFocus ? 2 : 1,
              ),
            ),
            child: child,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10, start: 5),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 180),
                  child: GestureDetector(
                    onTap: widget.onOpenCurrencyList,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CurrencyImage(
                          code: code,
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      code,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                              Flexible(
                                  child: Text(
                                widget.currency?.name ?? "",
                                overflow: TextOverflow.ellipsis,
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  enabled: widget.enabled,
                  maxLines: 1,
                  controller: widget.controller,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'\d+\.?\d*|\.\d+')),
                    CurrencyTextInputFormatter(
                      symbol: symbol,
                      name: widget.currency?.name,
                    ),
                  ],
                  maxLength: 20,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: code,
                    counterText: "",
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    // contentPadding: const EdgeInsets.all(10),
                    prefixIconConstraints: const BoxConstraints(maxWidth: 200),
                  ),
                  onChanged: (text) => widget.onChanged
                      ?.call(text.replaceAll(symbol, "").replaceAll(",", "")),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
