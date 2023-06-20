import 'models/crypto_coin.dart';

abstract class AbstractRepository {
  Future<List<CryptoCoin>> getCoinsList();
}
