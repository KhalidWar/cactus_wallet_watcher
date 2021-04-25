import 'package:animations/animations.dart';
import 'package:cactus_wallet_watcher/models/wallet_model.dart';
import 'package:cactus_wallet_watcher/screens/add_new_wallet.dart';
import 'package:cactus_wallet_watcher/screens/settings_screen.dart';
import 'package:cactus_wallet_watcher/screens/wallet_page.dart';
import 'package:cactus_wallet_watcher/services/hive_boxes.dart';
import 'package:cactus_wallet_watcher/shared_components/wallet_card.dart';
import 'package:cactus_wallet_watcher/state_management/wallets_state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(context),
      body: ValueListenableBuilder<Box<WalletModel>>(
        valueListenable: HiveBoxes.getWalletBoxes().listenable(),
        builder: (context, box, _) {
          final wallets = box.values.toList().cast<WalletModel>();

          if (wallets == null || wallets.isEmpty) {
            return Center(
              child: Text('No wallets found. Add a new wallet.'),
            );
          } else {
            return GridView.builder(
              itemCount: wallets.length,
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
                    return WalletCard(walletModel: wallets[index]);
                  },
                  openBuilder: (context, openWidget) {
                    context.read(walletsStateManagerProvider).walletModel =
                        wallets[index];
                    return WalletPage();
                  },
                );
              },
            );
          }
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

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
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
    );
  }
}
