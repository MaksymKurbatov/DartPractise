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
      home: const MyHomePage(title: 'Crypto App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i9) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin_logo.svg',
            width: 30,
            height: 30,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          title: Text(
            "BITCOIN",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            "2000000",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}
