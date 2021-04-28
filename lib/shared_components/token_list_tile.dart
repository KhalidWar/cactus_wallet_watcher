import 'package:cactus_wallet_watcher/models/ethplorer_account_balance.dart';
import 'package:cactus_wallet_watcher/services/niche_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TokenListTile extends StatelessWidget {
  const TokenListTile({Key key, this.token}) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final nicheFunction = NicheFunctions();

    final image = token.tokenInfo.image;
    final symbol = token.tokenInfo.symbol;
    final price = token.tokenInfo.price.rate;
    final balance = token.balance / 1000000000000000000;
    final holdingsValue = balance * price;

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
                    height: size.height * 0.03,
                  ),
            SizedBox(width: size.width * 0.02),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  symbol ?? '????',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.orange),
                ),
                Text('${nicheFunction.straightFormat(balance)}'),
              ],
            ),
          ],
        ),
      ),
      title: Text('\$${nicheFunction.compact(price)}'),
      trailing: Text(
        '\$${nicheFunction.straightFormat(holdingsValue)}',
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Colors.green,
            ),
      ),
    );
  }

  Container buildNoImage(Size size) {
    return Container(
      width: size.height * 0.03,
      child: Icon(Icons.help_outline),
    );
  }
}
