import 'package:hive/hive.dart';

part 'wallet_model.g.dart';

@HiveType(typeId: 0)
class WalletModel extends HiveObject {
  WalletModel(this.label, this.address, this.type);

  @HiveField(0)
  String label;

  @HiveField(1)
  String address;

  @HiveField(2)
  String type;
}
