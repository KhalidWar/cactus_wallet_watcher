import 'package:cactus_wallet_watcher/state_management/global_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Wallets', style: Theme.of(context).textTheme.headline6),
            Consumer(
              builder: (_, watch, __) {
                final walletsAsyncValue = watch(getWallets);
                return walletsAsyncValue.when(
                  loading: () => CircularProgressIndicator(),
                  data: (walletsList) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: walletsList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          dense: true,
                          title: Text('Ethereum Wallet'),
                          subtitle: Text(walletsList[index]),
                          onTap: () => buildWalletListSettings(
                              context, walletsList[index]),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return Center(child: Text(error.toString()));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future buildWalletListSettings(BuildContext context, String walletAddress) {
    final size = MediaQuery.of(context).size;

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                color: Colors.grey,
                thickness: 3,
                indent: size.width * 0.45,
                endIndent: size.width * 0.45,
              ),
              Text(
                'Ethereum Wallet',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: size.height * 0.01),
              Text(walletAddress),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete Wallet'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
