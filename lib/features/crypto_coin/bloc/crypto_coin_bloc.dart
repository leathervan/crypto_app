import 'dart:async';

import 'package:crypto_app/services/crypto_coin.dart';
import 'package:crypto_app/services/export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  final String coinName;
  final BasicCryptoCoinService coinRepo;

  CryptoCoinBloc(this.coinRepo, this.coinName)
      : super(CryptoCoinInitial()) {
    on<LoadCryptoCoinEvent>((event, emit) async {
      try {
        if (state is! CryptoCoinLoadedState) {
          emit(CryptoCoinLoadingState());
        }

        final cryptoCoin = await coinRepo.getCoin(coinName);
        emit(CryptoCoinLoadedState(cryptoCoin: cryptoCoin));
      } catch (e) {
        emit(CryptoCoinLoadedFailureState(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
}
