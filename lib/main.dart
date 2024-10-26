import 'package:crypto_app/crypto_app.dart';
import 'package:crypto_app/services/crypto_coin.dart';
import 'package:crypto_app/services/export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoCoinDetailsAdapter());
  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>('crypto_coins_box');

  GetIt.instance.registerLazySingleton<BasicCryptoCoinService>(() => ApiCryptoCoinsService(dio: Dio(), cryptoCoinsBox: cryptoCoinsBox));

  runApp(const CryptoApp());
}
