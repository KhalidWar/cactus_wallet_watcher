import 'package:cactus_wallet_watcher/models/wallet_model.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({Key key, this.walletModel}) : super(key: key);

  final WalletModel walletModel;

  String getWalletType(String walletType) {
    if (walletType == 'ethereum') {
      return 'assets/images/ethereum.png';
    } else {
      return 'assets/images/bitcoin.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final walletAddress = walletModel.address;

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              getWalletType(walletModel.type),
              width: size.width * 0.2,
            ),
          ),
          Text(
            walletModel.label,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '${walletAddress.substring(0, 4)}....${walletAddress.substring(walletAddress.length - 4)}',
          ),
        ],
      ),
    );
  }
}
