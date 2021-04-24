import 'package:cactus_wallet_watcher/models/wallet_model.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static Box<WalletModel> getWalletBoxes() {
    return Hive.box<WalletModel>('wallets');
  }
}
