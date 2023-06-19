import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(coin.imageURL),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(
        coin.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceInUSD}\$',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coins', arguments: coin);
        //     MaterialPageRoute(builder: (context) => const CoinScreen()));
      },
    );
  }
}
