import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({Key key, this.title, this.value}) : super(key: key);

  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      padding: EdgeInsets.all(size.height * 0.01),
      // color: kBlueNavyColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ethereum Wallet'),
              IconButton(
                icon: Icon(Icons.qr_code_outlined),
                onPressed: () => buildQRScanner(context),
              ),
            ],
          ),
          Text(
            '\$2000',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }

  Future buildQRScanner(BuildContext context) {
    return showModal(
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;

        return SimpleDialog(
          title: Text('Ethereum Wallet'),
          children: [
            Container(
              height: size.height * 0.3,
            ),
          ],
        );
      },
    );
  }
}
