import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({Key key, this.walletAddress}) : super(key: key);
  final String walletAddress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Ethereum Wallet')),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            QrImage(
              data: walletAddress,
              version: QrVersions.auto,
              size: size.height * 0.5,
              padding: EdgeInsets.all(size.height * 0.05),
            ),
            Column(
              children: [
                Text('Wallet Address'),
                SizedBox(height: size.height * 0.01),
                Text(walletAddress,
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            ElevatedButton(
              child: Text('Copy Address'),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: walletAddress));
              },
            ),
          ],
        ),
      ),
    );
  }
}
