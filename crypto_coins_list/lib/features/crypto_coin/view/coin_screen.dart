import 'package:flutter/material.dart';

import '../../../repositories/crypto_coins/models/crypto_coin.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  String? coinName;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null) {
      return;
    }

    if (args is CryptoCoin) {
      coinName = args.name;
    }

    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? "....")),
    );
  }
}
