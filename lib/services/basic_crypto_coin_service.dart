import 'crypto_coin.dart';

abstract class BasicCryptoCoinService {
  Future<List<CryptoCoin>> getCoinsList();

  Future<CryptoCoin> getCoin(String coin);
}
