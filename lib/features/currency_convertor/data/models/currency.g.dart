// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyAdapter extends TypeAdapter<Currency> {
  @override
  final int typeId = 5;

  @override
  Currency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Currency(
      code: fields[0] as String,
      name: fields[1] as String,
      symbol: fields[2] as String,
      decimalDigits: fields[3] as int,
      rounding: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.symbol)
      ..writeByte(3)
      ..write(obj.decimalDigits)
      ..writeByte(4)
      ..write(obj.rounding);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Currency _$$_CurrencyFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['decimal_digits'],
    disallowNullValues: const ['decimal_digits'],
  );
  return _$_Currency(
    code: json['code'] as String,
    name: json['name'] as String,
    symbol: json['symbol'] as String,
    decimalDigits: json['decimal_digits'] as int,
    rounding: json['rounding'] as int,
  );
}

Map<String, dynamic> _$$_CurrencyToJson(_$_Currency instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'symbol': instance.symbol,
      'decimal_digits': instance.decimalDigits,
      'rounding': instance.rounding,
    };
