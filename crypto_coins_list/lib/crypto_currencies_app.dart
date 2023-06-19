import 'package:flutter/material.dart';

import 'package:crypto_coins_list/roter/roter.dart';
import 'package:crypto_coins_list/theme/theme.dart';

class CryptoCurrenciesApp extends StatelessWidget {
  const CryptoCurrenciesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CryptoCurrency', theme: darkTheme, routes: routes);
  }
}
