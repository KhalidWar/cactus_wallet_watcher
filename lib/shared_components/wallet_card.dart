import 'package:cactus_wallet_watcher/models/wallet_model.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({Key key, this.walletModel}) : super(key: key);
  final WalletModel walletModel;

  Image getWalletImage(String walletType, Size size) {
    if (walletType == 'ethereum') {
      return Image.asset(
        'assets/images/ethereum.png',
        width: size.width * 0.2,
        color: Colors.grey,
      );
    } else {
      return Image.asset(
        'assets/images/bitcoin.png',
        width: size.width * 0.2,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final walletAddress = walletModel.address;

    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(child: getWalletImage(walletModel.type, size)),
          Text(
            walletModel.label,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 5),
          Text(
            '${walletAddress.substring(0, 4)}....${walletAddress.substring(walletAddress.length - 4)}',
          ),
        ],
      ),
    );
  }
}
