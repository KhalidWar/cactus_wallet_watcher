import 'package:cactus_wallet_watcher/confidential.dart';
import 'package:cactus_wallet_watcher/models/ethplorer_account_balance.dart';
import 'package:cactus_wallet_watcher/shared_components/token_list_header.dart';
import 'package:cactus_wallet_watcher/shared_components/token_list_tile.dart';
import 'package:cactus_wallet_watcher/shared_components/wallet_header.dart';
import 'package:cactus_wallet_watcher/state_management/class_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ethplorerAccountBalance = FutureProvider<EthplorerAccountBalance>((ref) {
  return ref.read(ethplorerAPIService).getAccountBalance(kMetaMask);
});

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: PageView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Consumer(
            builder: (_, watch, __) {
              final wallet = watch(ethplorerAccountBalance);
              return wallet.when(
                loading: () => Container(),
                data: (data) {
                  return Column(
                    children: [
                      WalletHeader(eth: data.eth),
                      Divider(color: Colors.black, height: 0),
                      TokenListHeader(),
                      Divider(color: Colors.black, height: 0),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return TokenListTile(token: data.tokens[index]);
                          },
                        ),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) =>
                    Center(child: Text(error.toString())),
              );
            },
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text('Wallet Watcher'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => buildAddWallet(),
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    );
  }

  Future buildAddWallet() {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) {
        return Container();
      },
    );
  }
}
