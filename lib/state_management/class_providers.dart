import 'package:cactus_wallet_watcher/services/ethplorer_api_service.dart';
import 'package:cactus_wallet_watcher/services/init_vitalik_wallet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ethplorerAPIService = Provider((ref) => EthplorerAPIService());
final initVitalikWallet = Provider((ref) => InitVitalikWallet());
