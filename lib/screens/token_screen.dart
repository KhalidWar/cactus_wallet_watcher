import 'package:cactus_wallet_watcher/models/ethplorer_account_balance.dart';
import 'package:flutter/material.dart';

class TokenScreen extends StatelessWidget {
  const TokenScreen({Key key, this.token}) : super(key: key);
  final Token token;

  @override
  Widget build(BuildContext context) {
    final tokenInfo = token.tokenInfo;

    return Scaffold(
      appBar: AppBar(title: Text('${tokenInfo.name} (${tokenInfo.symbol})')),
      body: Column(
        children: [],
      ),
    );
  }
}
