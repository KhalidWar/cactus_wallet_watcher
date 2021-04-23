import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final _futureSharedPref = SharedPreferences.getInstance();
  final _walletsKey = 'walletsKey';
  final _walletListKey = 'walletListKey';

  Future<void> saveWalletList(String wallet) async {
    final sharedPref = await _futureSharedPref;
    final currentWalletList = sharedPref.getStringList(_walletListKey) ?? [];
    currentWalletList.add(wallet);
    await sharedPref.setStringList(_walletListKey, currentWalletList);
  }

  Future<List<String>> loadWalletList() async {
    final sharedPref = await _futureSharedPref;
    return sharedPref.getStringList(_walletListKey);
  }

  Future<void> deleteWallet() async {
    final sharedPref = await _futureSharedPref;
    await sharedPref.remove(_walletsKey);
  }
}
