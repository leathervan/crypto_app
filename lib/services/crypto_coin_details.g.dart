// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailsAdapter extends TypeAdapter<CryptoCoinDetails> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetails(
      price: fields[0] as double,
      imageURL: fields[8] as String,
      highHour: fields[1] as double,
      lowHour: fields[2] as double,
      changeHour: fields[3] as double,
      highDay: fields[4] as double,
      lowDay: fields[5] as double,
      changeDay: fields[6] as double,
      marketcap: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetails obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.highHour)
      ..writeByte(2)
      ..write(obj.lowHour)
      ..writeByte(3)
      ..write(obj.changeHour)
      ..writeByte(4)
      ..write(obj.highDay)
      ..writeByte(5)
      ..write(obj.lowDay)
      ..writeByte(6)
      ..write(obj.changeDay)
      ..writeByte(7)
      ..write(obj.marketcap)
      ..writeByte(8)
      ..write(obj.imageURL);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetails _$CryptoCoinDetailsFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetails(
      price: (json['PRICE'] as num).toDouble(),
      imageURL: json['IMAGEURL'] as String,
      highHour: (json['HIGHHOUR'] as num).toDouble(),
      lowHour: (json['LOWHOUR'] as num).toDouble(),
      changeHour: (json['CHANGEHOUR'] as num).toDouble(),
      highDay: (json['HIGHDAY'] as num).toDouble(),
      lowDay: (json['LOWDAY'] as num).toDouble(),
      changeDay: (json['CHANGEDAY'] as num).toDouble(),
      marketcap: (json['MKTCAP'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoCoinDetailsToJson(CryptoCoinDetails instance) =>
    <String, dynamic>{
      'PRICE': instance.price,
      'HIGHHOUR': instance.highHour,
      'LOWHOUR': instance.lowHour,
      'CHANGEHOUR': instance.changeHour,
      'HIGHDAY': instance.highDay,
      'LOWDAY': instance.lowDay,
      'CHANGEDAY': instance.changeDay,
      'MKTCAP': instance.marketcap,
      'IMAGEURL': instance.imageURL,
    };
