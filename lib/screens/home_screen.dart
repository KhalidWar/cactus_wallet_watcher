import 'package:animations/animations.dart';
import 'package:cactus_wallet_watcher/screens/add_new_wallet.dart';
import 'package:cactus_wallet_watcher/screens/settings_screen.dart';
import 'package:cactus_wallet_watcher/screens/wallet_page.dart';
import 'package:cactus_wallet_watcher/shared_components/wallet_card.dart';
import 'package:cactus_wallet_watcher/state_management/global_providers.dart';
import 'package:cactus_wallet_watcher/state_management/wallets_state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Consumer(
        builder: (_, watch, __) {
          final walletsAsyncValue = watch(getWallets);

          return walletsAsyncValue.when(
            loading: () => CircularProgressIndicator(),
            data: (walletsList) {
              if (walletsList == null || walletsList.isEmpty) {
                return Center(
                  child: Text('No wallets found. Add a new wallet.'),
                );
              } else {
                return GridView.builder(
                  itemCount: walletsList.length,
                  padding: EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return OpenContainer(
                      closedElevation: 5,
                      closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      closedBuilder: (context, closedWidget) {
                        return WalletCard(walletAddress: walletsList[index]);
                      },
                      openBuilder: (context, openWidget) {
                        context
                            .read(walletsStateManagerProvider)
                            .walletAddress = walletsList[index];
                        return WalletPage();
                      },
                    );
                  },
                );
              }
            },
            error: (error, stackTrace) {
              return Center(child: Text(error.toString()));
            },
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text('Cactus Wallet Watcher'),
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SettingsScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
