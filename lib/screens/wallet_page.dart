import 'package:cactus_wallet_watcher/models/ethplorer_account_balance.dart';
import 'package:cactus_wallet_watcher/shared_components/token_list_header.dart';
import 'package:cactus_wallet_watcher/shared_components/token_list_tile.dart';
import 'package:cactus_wallet_watcher/shared_components/wallet_header.dart';
import 'package:cactus_wallet_watcher/state_management/class_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key key, this.walletAddress}) : super(key: key);
  final String walletAddress;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EthplorerAccountBalance>(
      future:
          context.read(ethplorerAPIService).getAccountBalance(walletAddress),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container();
          case ConnectionState.none:
            return Center(child: Text('ERROR'));
          default:
            return Column(
              children: [
                WalletHeader(
                  walletAddress: walletAddress,
                  eth: snapshot.data.eth,
                ),
                Divider(color: Colors.black, height: 0),
                TokenListHeader(),
                Divider(color: Colors.black, height: 0),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.tokens.length,
                    itemBuilder: (context, index) {
                      return TokenListTile(token: snapshot.data.tokens[index]);
                    },
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
