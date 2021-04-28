import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class NicheFunctions {
  String fixTimestamp(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final localTime = dateTime.toLocal();
    final day = localTime.day.toString().padLeft(2, '0');
    final month = localTime.month.toString().padLeft(2, '0');
    final year = localTime.year;
    final hour = localTime.hour;
    final minute = localTime.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }

  Image getWalletImage(String walletType, Size size) {
    if (walletType == 'ethereum') {
      return Image.asset(
        'assets/images/ethereum.png',
        width: size.width * 0.2,
        color: Colors.grey,
      );
    } else {
      return Image.asset(
        'assets/images/bitcoin.png',
        width: size.width * 0.2,
      );
    }
  }

  String compact(dynamic input) {
    final compactLong = NumberFormat.compact();
    return compactLong.format(input);
  }

  String straightFormat(double input) {
    var formation = NumberFormat("#,###,###.#");
    return formation.format(input);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
