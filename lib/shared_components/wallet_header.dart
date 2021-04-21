import 'package:animations/animations.dart';
import 'package:cactus_wallet_watcher/models/ethplorer_account_balance.dart';
import 'package:flutter/material.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({Key key, this.eth}) : super(key: key);

  final Eth eth;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.15,
      width: double.infinity,
      padding: EdgeInsets.all(size.height * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ethereum Wallet'),
              IconButton(
                icon: Icon(Icons.qr_code_outlined),
                onPressed: () => buildQRScanner(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${eth.balance.toStringAsPrecision(4)} Eth',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '\$${(eth.balance * eth.price.rate).roundToDouble()}',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future buildQRScanner(BuildContext context) {
    return showModal(
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;

        return SimpleDialog(
          title: Text('Ethereum Wallet'),
          children: [
            Container(
              height: size.height * 0.3,
            ),
          ],
        );
      },
    );
  }
}
