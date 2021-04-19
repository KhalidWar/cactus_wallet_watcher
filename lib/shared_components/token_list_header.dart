import 'package:flutter/material.dart';

class TokenListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Token'),
          Text('Price'),
          Text('Holding'),
        ],
      ),
    );
  }
}
