part of 'crypto_coin_bloc.dart';

sealed class CryptoCoinState extends Equatable {
  const CryptoCoinState();
}

final class CryptoCoinInitial extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

final class CryptoCoinLoadingState extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

final class CryptoCoinLoadedState extends CryptoCoinState {
  final CryptoCoin cryptoCoin;

  const CryptoCoinLoadedState({required this.cryptoCoin});

  @override
  List<Object?> get props => [cryptoCoin];
}

final class CryptoCoinLoadedFailureState extends CryptoCoinState {
  final Object? exception;

  const CryptoCoinLoadedFailureState({required this.exception});
  @override
  List<Object?> get props => [exception];
}
