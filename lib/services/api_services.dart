// import 'dart:convert';
//
// import 'package:block_explorer/constant_secret.dart';
// import 'package:block_explorer/models/account_balance.dart';
// import 'package:block_explorer/models/eth_price.dart';
// import 'package:block_explorer/models/eth_supply.dart';
// import 'package:block_explorer/models/tx_model.dart';
// import 'package:http/http.dart' as http;
//
// import '../constant_secret.dart';
// import '../constants.dart';
//
// class APIServices {
//   Future<AccountBalance> getAccountBalance(String address) async {
//     try {
//       final response = await http.get(
//         '$kBaseURL?module=$kModule&action=$kActionBalance&address=$address&tag=$kTagLatest&apikey=$kAPIKey',
//       );
//
//       if (jsonDecode(response.body)['status'] == '1') {
//         return AccountBalance.fromJson(jsonDecode(response.body));
//       } else {
//         return null;
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<TxDataModel> getTxList(String address) async {
//     try {
//       final response = await http.get(
//         '$kBaseURL?module=$kModule&action=$kActionTxList&address=$address&tag=$kTagLatest&apikey=$kAPIKey',
//       );
//
//       if (jsonDecode(response.body)['status'] == '1') {
//         return TxDataModel.fromJson(jsonDecode(response.body));
//       } else {
//         return null;
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<EthDataPrice> getEtherPrice() async {
//     try {
//       final response = await http.get(
//         '$kBaseURL?module=stats&action=ethprice&apikey=$kAPIKey',
//       );
//
//       if (jsonDecode(response.body)['status'] == '1') {
//         return EthDataPrice.fromJson(jsonDecode(response.body));
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       throw e;
//     }
//   }
//
//   Future<EthSupply> getEtherSupply() async {
//     try {
//       final response = await http.get(
//         '$kBaseURL?module=stats&action=ethsupply&apikey=$kAPIKey',
//       );
//
//       if (jsonDecode(response.body)['status'] == '1') {
//         return EthSupply.fromJson(jsonDecode(response.body));
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       throw e;
//     }
//   }
// }
