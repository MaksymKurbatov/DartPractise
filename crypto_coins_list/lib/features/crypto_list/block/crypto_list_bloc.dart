import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/abstract_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../repositories/crypto_coins/models/crypto_coin.dart';

part "crypto_list_event.dart";
part 'crypto_list_state.dart';

class CryptpoListBlock extends Bloc<CryptoListEvent, CryptoListState> {
  CryptpoListBlock(this.coinsRepository) : super(CryproListInitialState()) {
    on<LoadCryprtoList>((event, emit) async {
      try {
        final cryptoCoinsList = await coinsRepository.getCoinsList();
        emit(CryploListLoaded(coinsList: cryptoCoinsList));
      } catch (e, st) {
        emit(LoadingFailure(exeption: e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
  final AbstractRepository coinsRepository;
}
