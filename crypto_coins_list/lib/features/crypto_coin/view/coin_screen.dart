import 'package:crypto_coins_list/features/crypto_coin/block/crypto_coin_block.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/crypto_coins/models/crypto_coin.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  String? coinName;
  dynamic coinValue;
  final _cryptoCoinBlock = CryptoCoinBloc(GetIt.I<AbstractRepository>());
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null) {
      return;
    }

    if (args is CryptoCoin) {
      coinName = args.name;
    }
    _cryptoCoinBlock.add(LoadCryprtoCion(coinName: coinName as String));
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(coinName ?? "....")),
        body: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
          bloc: _cryptoCoinBlock,
          builder: (context, state) {
            if (state is CryptoCoinLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Image.network(
                    state.coinDetails.imageURL,
                    width: 150,
                    height: 150,
                  )),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(state.coinDetails.name),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 350,
                    height: 90,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 99, 98, 98),
                      borderRadius: BorderRadius.circular(
                          10), // Rounded corners with a radius of 10
                    ),
                    child: Center(
                      child: Text(
                        state.coinDetails.priceInUSD.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 350,
                    height: 90,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 99, 98, 98),
                      borderRadius: BorderRadius.circular(
                          10), // Rounded corners with a radius of 10
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Max Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              state.coinDetails.highDay.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Min Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              state.coinDetails.lowhDay.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox(); // Add a default return statement here
            }
          },
        ));
  }
}
