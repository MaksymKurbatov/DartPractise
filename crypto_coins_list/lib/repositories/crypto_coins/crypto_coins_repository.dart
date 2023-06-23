import 'package:crypto_coins_list/repositories/crypto_coins/abstract_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:dio/dio.dart';

class CryproCoinsRepository implements AbstractRepository {
  const CryproCoinsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,AID,BRAT,DOV,CAG,SOl&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryproCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageURL = usdData['IMAGEURL'];
      return CryptoCoin(
          name: e.key,
          priceInUSD: price,
          imageURL: 'https://www.cryptocompare.com/$imageURL');
    }).toList();
    return cryproCoinsList;
  }

  @override
  Future<dynamic> getCoinsDetails(coinName) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=${coinName}&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'][coinName]['USD'];
    final imageURL = dataRaw['IMAGEURL'];
    final coinDetails = CryptoCoinDetails(
        name: coinName,
        priceInUSD: dataRaw['PRICE'],
        imageURL: 'https://www.cryptocompare.com/$imageURL',
        highDay: dataRaw['HIGHDAY'],
        lowhDay: dataRaw['LOWDAY']);
    return coinDetails;
  }
}
