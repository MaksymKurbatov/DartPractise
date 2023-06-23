part of "crypto_coin_block.dart";

class CryptoCoinEvent {
  
}

class LoadCryprtoCion extends CryptoCoinEvent {
  LoadCryprtoCion({this.completer, required this.coinName});
  final Completer? completer;
  final String coinName;
}
