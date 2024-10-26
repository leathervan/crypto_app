import 'package:crypto_app/services/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  final CryptoCoin cryptoCoin;

  const CryptoCoinTile({super.key, required this.cryptoCoin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        cryptoCoin.details.imageURL,
        height: 45,
        width: 45,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cryptoCoin.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cryptoCoin.details.price.toStringAsFixed(8),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                '${cryptoCoin.details.changeDay >= 0 ? '+' : ''}${cryptoCoin.details.changeDay.toStringAsFixed(2)}\$',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: cryptoCoin.details.changeDay >= 0
                          ? Colors.green
                          : Colors.red,
                    ),
              ),
            ],
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        Navigator.of(context)
            .pushNamed('/cryptocoin', arguments: cryptoCoin.name);
      },
    );
  }
}
