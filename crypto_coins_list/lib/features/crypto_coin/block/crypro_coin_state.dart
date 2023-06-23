part of "crypto_coin_block.dart";

class CryptoCoinState {}

class CryproInitInitialState extends CryptoCoinState {}

class CryptoCoinLoaded extends CryptoCoinState {
  CryptoCoinLoaded({required this.coinDetails});

  final dynamic coinDetails;
}

class LoadingFailure extends CryptoCoinState {
  LoadingFailure({this.exeption});
  final Object? exeption;
}
