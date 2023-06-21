import 'dart:async';
import 'package:crypto_coins_list/features/crypto_list/block/crypto_list_bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../widgets/crypto_coin_tile.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBlock = CryptpoListBlock(GetIt.I<AbstractRepository>());

  @override
  void initState() {
    _cryptoListBlock.add(LoadCryprtoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBlock.add(LoadCryprtoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptpoListBlock, CryptoListState>(
            bloc: _cryptoListBlock,
            builder: (context, state) {
              if (state is CryploListLoaded) {
                return ListView.separated(
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinTile(coin: coin);
                  },
                );
              }
              if (state is LoadingFailure) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("something went wrong"),
                    const SizedBox(height: 30),
                    TextButton(onPressed: () {}, child: const Text('Try Again'))
                  ],
                ));
              }

              return Container();
            },
          ),
        ));
  }
}
