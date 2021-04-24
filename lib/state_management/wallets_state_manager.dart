import 'package:cactus_wallet_watcher/models/wallet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final walletsStateManagerProvider =
    ChangeNotifierProvider((ref) => WalletsStateManager());

class WalletsStateManager extends ChangeNotifier {
  WalletModel walletModel;
}
