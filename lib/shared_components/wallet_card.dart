import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({Key key, this.walletAddress, this.storeIcon})
      : super(key: key);

  final String storeIcon, walletAddress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/ethereum.png',
              width: size.width * 0.25,
            ),
          ),
          Text(
            'Ethereum Wallet',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '${walletAddress.substring(0, 4)}...${walletAddress.substring(38)}',
          ),
        ],
      ),
    );
  }
}
