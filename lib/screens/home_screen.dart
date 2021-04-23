import 'package:cactus_wallet_watcher/screens/add_new_wallet.dart';
import 'package:cactus_wallet_watcher/screens/wallet_page.dart';
import 'package:cactus_wallet_watcher/state_management/class_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> walletsList = [];

  void getWallets() async {
    final wallet = await context.read(sharedPrefProvider).loadWallets();
    if (wallet != null) {
      walletsList.add(wallet);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getWallets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: PageView.builder(
        itemCount: walletsList.isEmpty ? 1 : walletsList.length,
        itemBuilder: (context, index) {
          if (walletsList.isEmpty) {
            return Center(child: Text('No wallets found. Add a new wallet.'));
          } else {
            return WalletPage(walletAddress: walletsList[index]);
          }
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddNewWallet();
                },
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    );
  }
}
