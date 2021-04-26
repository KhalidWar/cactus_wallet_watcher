import 'dart:io';

import 'package:animations/animations.dart';
import 'package:cactus_wallet_watcher/models/ethplorer_account_balance.dart';
import 'package:cactus_wallet_watcher/shared_components/confirmation_dialog.dart';
import 'package:cactus_wallet_watcher/shared_components/token_list_header.dart';
import 'package:cactus_wallet_watcher/shared_components/token_list_tile.dart';
import 'package:cactus_wallet_watcher/shared_components/wallet_header.dart';
import 'package:cactus_wallet_watcher/state_management/class_providers.dart';
import 'package:cactus_wallet_watcher/state_management/wallets_state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';

final walletProvider =
    FutureProvider.autoDispose<EthplorerAccountBalance>((ref) {
  final walletAddress =
      ref.read(walletsStateManagerProvider).walletModel.address;
  return ref.read(ethplorerAPIService).getAccountBalance(walletAddress);
});

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(context),
      body: Consumer(
        builder: (_, watch, __) {
          final walletAsyncValue = watch(walletProvider);

          return walletAsyncValue.when(
            loading: () => Center(child: CircularProgressIndicator()),
            data: (data) {
              return DefaultTabController(
                length: 2,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        expandedHeight: size.height * 0.25,
                        elevation: 0,
                        floating: true,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Padding(
                            padding: EdgeInsets.only(bottom: 35),
                            child: WalletHeader(eth: data.eth),
                          ),
                        ),
                        bottom: TabBar(
                          tabs: [
                            Tab(child: Text('Tokens')),
                            Tab(child: Text('Transactions')),
                          ],
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      Column(
                        children: [
                          TokenListHeader(),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.tokens.length,
                              itemBuilder: (context, index) {
                                return TokenListTile(token: data.tokens[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(),
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) {
              return Center(child: Text(error.toString()));
            },
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final confirmationDialog = ConfirmationDialog();
    final walletModel = context.read(walletsStateManagerProvider).walletModel;

    void remove() {
      context.read(walletsStateManagerProvider).walletModel.delete();
      Navigator.pop(context);
      Navigator.pop(context);
    }

    return AppBar(
      elevation: 0,
      title: Text(walletModel.label),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return ['Delete recipient'].map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
          onSelected: (String choice) {
            showModal(
              context: context,
              builder: (context) {
                return Platform.isIOS
                    ? confirmationDialog.iOSAlertDialog(context,
                        kDeleteWalletConfirmation, remove, 'Delete recipient')
                    : confirmationDialog.androidAlertDialog(context,
                        kDeleteWalletConfirmation, remove, 'Delete recipient');
              },
            );
          },
        ),
      ],
    );
  }
}
