import 'dart:async';

import 'package:crypto_app/services/crypto_coin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/services/export.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final BasicCryptoCoinService coinRepo;

  CryptoListBloc(this.coinRepo) : super(CryptoListInitial()) {
    on<LoadCryptoListEvent>((event, emit) async {
      try {
        if (state is! CryptoListLoadedState) {
          emit(CryptoListLoadingState());
        }

        final cryptoCoinsList = await coinRepo.getCoinsList();
        emit(CryptoListLoadedState(cryptoCoinsList: cryptoCoinsList));
      } catch (e) {
        emit(CryptoListLoadedFailureState(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
}
