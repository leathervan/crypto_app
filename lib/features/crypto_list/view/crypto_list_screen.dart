import 'dart:async';

import 'package:crypto_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_app/features/crypto_list/widgets/export.dart';
import 'package:crypto_app/services/export.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final cryptoListBloc = CryptoListBloc(GetIt.instance<BasicCryptoCoinService>());

  @override
  void initState() {
    cryptoListBloc.add(LoadCryptoListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CryptoApp',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: Colors.yellow,
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
        onRefresh: () async {
          final completer = Completer();
          cryptoListBloc.add(LoadCryptoListEvent(completer: completer));
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoadedState) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                  itemCount: state.cryptoCoinsList.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.white24,
                    height: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return CryptoCoinTile(
                      cryptoCoin: state.cryptoCoinsList[index],
                    );
                  },
                ),
              );
            } else if (state is CryptoListLoadedFailureState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Somesthing went wrong',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 18),
                    ),
                    Text(
                      'Please try again later',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: OutlinedButton(
                          onPressed: () {
                            cryptoListBloc.add(LoadCryptoListEvent());
                          },
                          child: const Icon(Icons.refresh)),
                    )
                  ],
                ),
              );
            } else if (state is CryptoListLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center();
          },
        ),
      ),
      
    );
  }
}
