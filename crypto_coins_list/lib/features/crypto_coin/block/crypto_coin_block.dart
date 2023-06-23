import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/abstract_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "crypro_coin_state.dart";
part 'crypto_coin_event.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinBloc(this.coinsRepository) : super(CryproInitInitialState()) {
    on<LoadCryprtoCion>((event, emit) async {
      try {
        final cryptoCoin =
            await coinsRepository.getCoinsDetails(event.coinName);
        emit(CryptoCoinLoaded(coinDetails: cryptoCoin));
      } catch (e) {
        emit(LoadingFailure(exeption: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
  final AbstractRepository coinsRepository;
}
