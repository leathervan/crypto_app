import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
// ignore: must_be_immutable
class CryptoCoinDetails extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double price;

  @HiveField(1)
  @JsonKey(name: 'HIGHHOUR')
  final double highHour;

  @HiveField(2)
  @JsonKey(name: 'LOWHOUR')
  final double lowHour;

  @HiveField(3)
  @JsonKey(name: 'CHANGEHOUR')
  final double changeHour;

  @HiveField(4)
  @JsonKey(name: 'HIGHDAY')
  final double highDay;

  @HiveField(5)
  @JsonKey(name: 'LOWDAY')
  final double lowDay;

  @HiveField(6)
  @JsonKey(name: 'CHANGEDAY')
  final double changeDay;

  @HiveField(7)
  @JsonKey(name: 'MKTCAP')
  final double marketcap;

  @HiveField(8)
  @JsonKey(name: 'IMAGEURL')
  String imageURL;

  CryptoCoinDetails(
      {required this.price,
      required this.imageURL,
      required this.highHour,
      required this.lowHour,
      required this.changeHour,
      required this.highDay,
      required this.lowDay,
      required this.changeDay,
      required this.marketcap});

  @override
  List<Object?> get props => [
        price,
        imageURL,
        highHour,
        lowHour,
        changeHour,
        highDay,
        lowDay,
        changeDay,
        marketcap
      ];

  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);
}
