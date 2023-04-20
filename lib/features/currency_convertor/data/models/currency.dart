import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@freezed
@HiveType(typeId: 5)
class Currency with _$Currency {
  const factory Currency({
    @HiveField(0) required String code,
    @HiveField(1) required String name,
    @HiveField(2) required String symbol,
    @JsonKey(name: 'decimal_digits', required: true, disallowNullValue: true)
    @HiveField(3)
        required int decimalDigits,
    @HiveField(4) required int rounding,
  }) = _Currency;
  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
