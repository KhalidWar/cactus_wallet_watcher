import 'package:flutter/material.dart';

class WalletErrorWidget extends StatelessWidget {
  const WalletErrorWidget({Key key, this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber_rounded,
          size: size.height * 0.25,
          color: Colors.red,
        ),
        Text(
          'Something went wrong',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: size.height * 0.05),
        Text(error, textAlign: TextAlign.center),
      ],
    );
  }
}
