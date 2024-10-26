import 'package:crypto_app/services/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'export.dart';

class ApiCryptoCoinsService implements BasicCryptoCoinService {
  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;
  final String imageURLPrefix = 'https://www.cryptocompare.com/';
  final String requiredCoinsList = 'BTC,ETH,BNB,ARB,ENS,APT,SUI,PEPE,FLOKI,SOL';

  ApiCryptoCoinsService({required this.dio, required this.cryptoCoinsBox});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$requiredCoinsList&tsyms=USD');

    return _getResponseData(response);
  }

  @override
  Future<CryptoCoin> getCoin(String coin) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$coin&tsyms=USD');

    return _getResponseData(response).first;
  }

  List<CryptoCoin> _getResponseData(Response<dynamic> response) {
    final data =
        (response.data as Map<String, dynamic>)['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = data.entries.map((entry) {
      final coinData =
          (entry.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final coin = CryptoCoin(
          name: entry.key, details: CryptoCoinDetails.fromJson(coinData));
      coin.details.imageURL = imageURLPrefix + coin.details.imageURL;
      return coin;
    }).toList();
    return cryptoCoinsList;
  }
}
