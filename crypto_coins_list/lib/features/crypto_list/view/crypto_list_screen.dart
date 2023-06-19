import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          return const CryptoCoinTile(coinName: coinName);
        },
      ),
    );
  }
}

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
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
        "7000000",
        style: Theme.of(context).textTheme.labelSmall,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coins', arguments: coinName);
        //     MaterialPageRoute(builder: (context) => const CoinScreen()));
      },
    );
  }
}
