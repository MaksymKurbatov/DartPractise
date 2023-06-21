part of 'crypto_list_bloc.dart';

class CryptoListEvent extends Equatable {6
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class LoadCryprtoList extends CryptoListEvent {
  LoadCryprtoList({this.completer});
  final Completer? completer;

    @override

  List<Object?> get props =>[completer];
}
