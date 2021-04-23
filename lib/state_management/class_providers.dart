import 'package:cactus_wallet_watcher/services/ethplorer_api_service.dart';
import 'package:cactus_wallet_watcher/services/shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ethplorerAPIService = Provider((ref) => EthplorerAPIService());
final sharedPrefProvider = Provider((ref) => SharedPref());
