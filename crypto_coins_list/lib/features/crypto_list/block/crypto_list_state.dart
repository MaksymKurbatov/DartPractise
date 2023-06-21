part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryproListInitialState extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryploListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryploListLoaded extends CryptoListState {
  CryploListLoaded({required this.coinsList});
  final List<CryptoCoin> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class LoadingFailure extends CryptoListState {
  LoadingFailure({this.exeption});
  final Object? exeption;

  @override
  List<Object?> get props => [exeption];
}
