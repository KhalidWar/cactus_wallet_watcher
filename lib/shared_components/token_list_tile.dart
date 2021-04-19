import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TokenListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/ethereum.png', height: 20),
                SizedBox(width: size.width * 0.02),
                Text('ETH', style: Theme.of(context).textTheme.headline6),
              ],
            ),
            Text('\$2000'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('32', style: Theme.of(context).textTheme.bodyText1),
                Text('\$64000', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
