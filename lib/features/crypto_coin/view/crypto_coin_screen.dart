

import 'package:crypto_app/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:crypto_app/services/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../widgets/crypto_coin_info.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String cryptoCoinName = '';
  late CryptoCoinBloc cryptoCoinBloc;

  @override
  void initState() {
    super.initState();
    cryptoCoinBloc = CryptoCoinBloc(
        GetIt.instance<BasicCryptoCoinService>(), cryptoCoinName);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is String) {
      setState(() {
        cryptoCoinName = args;
        cryptoCoinBloc = CryptoCoinBloc(
            GetIt.instance<BasicCryptoCoinService>(), cryptoCoinName);
      });
      cryptoCoinBloc.add(const LoadCryptoCoinEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cryptoCoinName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
        bloc: cryptoCoinBloc,
        builder: (context, state) {
          if (state is CryptoCoinLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CryptoCoinLoadedFailureState) {
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
                          cryptoCoinBloc.add(const LoadCryptoCoinEvent());
                        },
                        child: const Icon(Icons.refresh)),
                  )
                ],
              ),
            );
          } else if (state is CryptoCoinLoadedState) {
            return CryptoCoinInfo(cryptoCoin: state.cryptoCoin);
          }
          return const Center();
        },
      ),
    );
  }
}
