import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';

import '../widgets/crypto_coin_tile.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: (_cryptoCoinsList == null)
          ? const SizedBox()
          : ListView.separated(
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coinName = _cryptoCoinsList![i];
                return CryptoCoinTile(coin: coinName);
              },
            ),
    );
  }

  Future<void> loadCryptoCoins() async {
    _cryptoCoinsList = await CryproCoinsRepository().getCoinsList();
    setState(() {});
  }
}
