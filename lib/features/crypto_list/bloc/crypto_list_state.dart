part of 'crypto_list_bloc.dart';

sealed class CryptoListState extends Equatable {}

final class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

final class CryptoListLoadingState extends CryptoListState {
  @override
  List<Object?> get props => [];
}

final class CryptoListLoadedState extends CryptoListState {
  final List<CryptoCoin> cryptoCoinsList;

  CryptoListLoadedState({required this.cryptoCoinsList});

  @override
  List<Object?> get props => [cryptoCoinsList];
}

final class CryptoListLoadedFailureState extends CryptoListState {
  final Object? exception;

  CryptoListLoadedFailureState({required this.exception});

  @override
  List<Object?> get props => [exception];
}
