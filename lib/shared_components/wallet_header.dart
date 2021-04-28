import 'package:cactus_wallet_watcher/models/ethplorer_account_balance.dart';
import 'package:cactus_wallet_watcher/screens/qr_screen.dart';
import 'package:cactus_wallet_watcher/services/niche_functions.dart';
import 'package:cactus_wallet_watcher/state_management/wallets_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_page_route.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({Key key, this.eth}) : super(key: key);

  final Eth eth;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final nicheFunction = NicheFunctions();
    final walletAddress =
        context.read(walletsStateManagerProvider).walletModel.address;

    final totalValue = eth.balance * eth.price.rate;

    return Container(
      padding: EdgeInsets.all(size.height * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ethereum Wallet',
                style: Theme.of(context).textTheme.headline6,
              ),
              IconButton(
                icon: Icon(Icons.qr_code_outlined, size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(QRScreen(walletAddress: walletAddress)),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${nicheFunction.compact(eth.balance)} ETH',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '\$${nicheFunction.compact(totalValue)}',
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
}
