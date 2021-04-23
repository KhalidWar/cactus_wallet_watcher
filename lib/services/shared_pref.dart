import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final _futureSharedPref = SharedPreferences.getInstance();
  final _walletsKey = 'walletsKey';

  Future<void> saveWallet(String wallet) async {
    final sharedPref = await _futureSharedPref;
    await sharedPref.setString(_walletsKey, wallet);
  }

  Future<String> loadWallets() async {
    final sharedPref = await _futureSharedPref;
    return sharedPref.getString(_walletsKey);
  }

  Future<void> deleteWallet() async {
    final sharedPref = await _futureSharedPref;
    await sharedPref.remove(_walletsKey);
  }
}
