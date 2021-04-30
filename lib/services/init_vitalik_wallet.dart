import 'package:cactus_wallet_watcher/models/wallet_model.dart';
import 'package:cactus_wallet_watcher/services/hive_boxes.dart';
import 'package:hive/hive.dart';

import '../constants.dart';

class InitVitalikWallet {
  static const _vitalikWalletKey = 'vitalikWalletKey';
  final _walletBoxes = HiveBoxes.getWalletBoxes();

  bool _isVitWalletAdded;
  Box _hiveBox;

  Future _openBox() async {
    if (_hiveBox != null) return;
    _hiveBox = await Hive.openBox(_vitalikWalletKey);
  }

  Future<void> _saveData(bool input) async {
    await _hiveBox.put(_vitalikWalletKey, input);
  }

  Future<void> _loadData() async {
    return _isVitWalletAdded = await _hiveBox.get(_vitalikWalletKey) ?? false;
  }

  bool _isVitalikWalletAdded() {
    for (WalletModel wallet in _walletBoxes.values) {
      if (wallet.address.compareTo(kVitalikWallet) == 0) {
        return true;
      }
    }
    return false;
  }

  void addVitalikWallet() async {
    await _openBox();
    await _loadData();
    if (!_isVitalikWalletAdded() && _isVitWalletAdded == false) {
      final vitalikWallet = WalletModel('Vitalik', kVitalikWallet, 'ethereum');
      _walletBoxes.add(vitalikWallet);
      await _saveData(true);
    }
  }
}
