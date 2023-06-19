import 'package:crypto_coins_list/features/crypto_coin/crypro_coin.dart';
import 'package:crypto_coins_list/features/crypto_list/crypro_list.dart';

final routes = {
  '/': (context) => const CryptoListScreen(title: 'Crypto App'),
  '/coins': (context) => const CoinScreen()
};
