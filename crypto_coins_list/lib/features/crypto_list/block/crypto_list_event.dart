part of 'crypto_list_bloc.dart';

class CryptoListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCryprtoList extends CryptoListEvent {
  LoadCryprtoList({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
