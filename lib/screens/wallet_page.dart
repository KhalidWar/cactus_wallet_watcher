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

final walletProvider =
    FutureProvider.autoDispose<EthplorerAccountBalance>((ref) {
  final walletAddress = ref.read(walletsStateManagerProvider).walletAddress;
  return ref.read(ethplorerAPIService).getAccountBalance(walletAddress);
});

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Consumer(
        builder: (_, watch, __) {
          final walletAsyncValue = watch(walletProvider);

          return walletAsyncValue.when(
            loading: () => Center(child: CircularProgressIndicator()),
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
                      itemCount: data.tokens.length,
                      itemBuilder: (context, index) {
                        return TokenListTile(token: data.tokens[index]);
                      },
                    ),
                  ),
                ],
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

    void remove() {
      Navigator.pop(context);
    }

    return AppBar(
      title: Text('Ethereum Wallet'),
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
                    ? confirmationDialog.iOSAlertDialog(
                        context,
                        'kDeleteRecipientDialogText',
                        remove,
                        'Delete recipient')
                    : confirmationDialog.androidAlertDialog(
                        context,
                        'kDeleteRecipientDialogText',
                        remove,
                        'Delete recipient');
              },
            );
          },
        ),
      ],
    );
  }
}
