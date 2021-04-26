import 'package:flutter/material.dart';

class TokenListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 18,
            right: 18,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Token',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Price',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Holdings',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        Divider(height: 0),
      ],
    );
  }
}
