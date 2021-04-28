import 'package:cactus_wallet_watcher/models/transaction_model.dart';
import 'package:cactus_wallet_watcher/services/niche_functions.dart';
import 'package:cactus_wallet_watcher/shared_components/wallet_error_widget.dart';
import 'package:cactus_wallet_watcher/state_management/class_providers.dart';
import 'package:cactus_wallet_watcher/state_management/wallets_state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionProvider =
    FutureProvider.autoDispose<List<TransactionModel>>((ref) {
  final walletAddress =
      ref.read(walletsStateManagerProvider).walletModel.address;
  return ref.read(ethplorerAPIService).getAccountTxs(walletAddress);
});

class TransactionsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final txAsyncValue = watch(transactionProvider);

    return txAsyncValue.when(
        loading: () => Center(child: CircularProgressIndicator()),
        data: (data) {
          if (data == null || data.isEmpty)
            return Center(child: Text('No transactions found'));
          else
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final tx = data[index];

                return ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: tx.success
                      ? Icon(Icons.check, color: Colors.green)
                      : Icon(Icons.close_rounded, color: Colors.red),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Value: ${tx.value.toStringAsFixed(2)} ETH'),
                      Text(
                        'Time: ${NicheFunctions().fixTimestamp(tx.timestamp)}',
                      ),
                    ],
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${tx.from.substring(0, 5)}....${tx.from.substring(tx.from.length - 5)}',
                      ),
                      Icon(Icons.arrow_forward),
                      Text(
                        '${tx.to.substring(0, 5)}....${tx.to.substring(tx.to.length - 5)}',
                      ),
                    ],
                  ),
                );
              },
            );
        },
        error: (error, stackTrace) {
          return WalletErrorWidget(error: error.toString());
        });
  }
}
