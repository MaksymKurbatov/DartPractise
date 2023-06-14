import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesApp());
}

class CryptoCurrenciesApp extends StatelessWidget {
  const CryptoCurrenciesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CryptoCurrency',
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 60, 58, 58),
            primarySwatch: Colors.yellow,
            dividerColor: Colors.white70,
            listTileTheme: const ListTileThemeData(iconColor: Colors.white),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.yellow,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Color.fromARGB(255, 60, 58, 58),
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                )),
            textTheme: TextTheme(
                bodyMedium: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                labelSmall: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                    fontSize: 14))),
        routes: {
          '/': (context) => const CryptoListScreen(title: 'Crypto App'),
          '/coins': (context) => const CoinScreen()
        });
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          const coinName = "BNB";
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/bitcoin_logo.svg',
              width: 30,
              height: 30,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            title: Text(
              coinName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              "2000000",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/coins', arguments: coinName);
              //     MaterialPageRoute(builder: (context) => const CoinScreen()));
            },
          );
        },
      ),
    );
  }
}

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
      print("MUST PROVID ARGS");
      return;
    }
    if (args is! String) {
      print("STRING");
      return;
    }

    setState(() {
      coinName = args;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? "....")),
    );
  }
}
