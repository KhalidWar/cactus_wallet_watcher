import 'dart:convert';

import 'package:cactus_wallet_watcher/constants.dart';
import 'package:cactus_wallet_watcher/models/ethplorer_account_balance.dart';
import 'package:http/http.dart' as http;

class EthplorerAPIService {
  static const _kEthplorerFreeAPIKey = 'freekey';

  Future<EthplorerAccountBalance> getAccountBalance(
      String walletAddress) async {
    try {
      final response = await http.get(Uri.parse(
        '$kEthplorerBaseURL/$kEthplorerAddressInfoURL/$walletAddress?apiKey=$_kEthplorerFreeAPIKey',
      ));

      if (response.statusCode == 200) {
        return EthplorerAccountBalance.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }
}
