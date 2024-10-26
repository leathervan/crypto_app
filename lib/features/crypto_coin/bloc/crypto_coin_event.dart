part of 'crypto_coin_bloc.dart';

sealed class CryptoCoinEvent extends Equatable {
  const CryptoCoinEvent();
}

class LoadCryptoCoinEvent extends CryptoCoinEvent {
  final Completer? completer;

  const LoadCryptoCoinEvent({this.completer});

  @override
  List<Object?> get props => [completer];
}
