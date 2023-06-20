import 'package:crypto_coins_list/repositories/crypto_coins/abstract_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'crypto_currencies_app.dart';
import 'repositories/crypto_coins/crypto_coins_repository.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractRepository>(
      () => CryproCoinsRepository(dio: Dio()));
  runApp(const CryptoCurrenciesApp());
}
