import 'package:crypto_app/services/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoCoinInfo extends StatelessWidget {
  final CryptoCoin cryptoCoin;

  const CryptoCoinInfo({super.key, required this.cryptoCoin});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.network(
            cryptoCoin.details.imageURL,
            height: 200,
            width: 200,
          ),
          Text(
            '${cryptoCoin.details.price}\$',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 22,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Card(
                  color: const Color.fromARGB(255, 45, 45, 45),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Capitalization:',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          '${formatNumber(cryptoCoin.details.marketcap)}\$',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 45, 45, 45),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Low hour price: ${cryptoCoin.details.lowHour.toStringAsFixed(8)}\$',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  'High hour price: ${cryptoCoin.details.highHour.toStringAsFixed(8)}\$',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            Text(
                              '${cryptoCoin.details.changeHour >= 0 ? '+' : ''}${cryptoCoin.details.changeHour.toStringAsFixed(2)}\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: cryptoCoin.details.changeHour >= 0
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 45, 45, 45),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Low day price: ${cryptoCoin.details.lowDay.toStringAsFixed(8)}\$',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  'High day price: ${cryptoCoin.details.highDay.toStringAsFixed(8)}\$',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            Text(
                              '${cryptoCoin.details.changeDay >= 0 ? '+' : ''}${cryptoCoin.details.changeDay.toStringAsFixed(2)}\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: cryptoCoin.details.changeDay >= 0
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatNumber(double number) {
    final formatter = NumberFormat.compact();
    return formatter.format(number);
  }
}
