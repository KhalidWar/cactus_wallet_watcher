import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'class_providers.dart';

final getWallets = FutureProvider<List<String>>((ref) {
  return ref.read(sharedPrefProvider).loadWalletList();
});
