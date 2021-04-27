import 'package:cactus_wallet_watcher/models/ethplorer_account_balance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TokenListTile extends StatelessWidget {
  const TokenListTile({Key key, this.token}) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final image = token.tokenInfo.image;
    final symbol = token.tokenInfo.symbol;
    final price = token.tokenInfo.price;
    final balance = token.balance;

    return ListTile(
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Container(
        width: size.width * 0.4,
        child: Row(
          children: [
            image == null
                ? buildNoImage(size)
                : Image.network(
                    '$kEthplorerIO/$image',
                    height: size.height * 0.035,
                  ),
            SizedBox(width: size.width * 0.02),
            Text(
              symbol,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.orange),
            ),
          ],
        ),
      ),
      title: Text(price.toStringAsExponential(1)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('${balance.toStringAsExponential(1)}'),
          Text('${(price * balance).toStringAsExponential(1)}'),
        ],
      ),
    );
  }

  Container buildNoImage(Size size) {
    return Container(
      width: size.height * 0.035,
      child: Icon(Icons.help_outline),
    );
  }
}
