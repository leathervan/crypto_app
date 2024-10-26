part of 'crypto_list_bloc.dart';

sealed class CryptoListEvent extends Equatable {}

class LoadCryptoListEvent extends CryptoListEvent{
  final Completer? completer;

  LoadCryptoListEvent({this.completer});
  
  @override
  List<Object?> get props => [completer];
}
