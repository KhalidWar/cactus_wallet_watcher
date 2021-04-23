import 'package:animations/animations.dart';
import 'package:cactus_wallet_watcher/screens/wallet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> walletsList = [];

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
            return WalletPage(walletAddress: walletsList[0]);
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
    return showModal(
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;

        return SimpleDialog(
          title: Text('Ethereum Wallet'),
          children: [
            Container(
              height: size.height * 0.3,
              child: Column(
                children: [
                  TextFormField(),
                  ElevatedButton(
                    child: Text('Add Wallet'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
