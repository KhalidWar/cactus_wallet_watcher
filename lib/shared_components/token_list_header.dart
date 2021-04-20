import 'package:flutter/material.dart';

class TokenListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Token'),
          Text('Price'),
          Text('Holdings'),
        ],
      ),
    );
  }
}
