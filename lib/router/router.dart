import '../features/crypto_coin/view/export.dart';
import '../features/crypto_list/view/export.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/cryptocoin': (context) => const CryptoCoinScreen(),
};
