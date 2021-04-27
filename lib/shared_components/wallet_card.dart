import 'package:cactus_wallet_watcher/models/wallet_model.dart';
import 'package:cactus_wallet_watcher/services/niche_functions.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({Key key, this.walletModel}) : super(key: key);
  final WalletModel walletModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final walletAddress = walletModel.address;

    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: NicheFunctions().getWalletImage(walletModel.type, size),
          ),
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
