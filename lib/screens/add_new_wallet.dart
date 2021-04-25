import 'package:cactus_wallet_watcher/models/wallet_model.dart';
import 'package:cactus_wallet_watcher/services/form_validation.dart';
import 'package:cactus_wallet_watcher/services/hive_boxes.dart';
import 'package:cactus_wallet_watcher/shared_components/wallet_card.dart';
import 'package:flutter/material.dart';

enum WalletType { ethereum, bitcoin }

class AddNewWallet extends StatefulWidget {
  @override
  _AddNewWalletState createState() => _AddNewWalletState();
}

class _AddNewWalletState extends State<AddNewWallet> {
  final _addressFormKey = GlobalKey<FormState>();
  final _labelFormKey = GlobalKey<FormState>();
  final _addressTextController = TextEditingController();
  final _labelTextController = TextEditingController();

  WalletType _walletType = WalletType.ethereum;

  final _ethereumWallet = WalletModel(
      'label', 'addressaddressaddressaddressaddressaddress', 'ethereum');

  final _bitcoinWallet = WalletModel(
      'label', 'addressaddressaddressaddressaddressaddress', 'bitcoin');

  void _addWallet() {
    if (_addressFormKey.currentState.validate() &&
        _labelFormKey.currentState.validate()) {
      final wallet = WalletModel(
        _labelTextController.text.trim(),
        _addressTextController.text.trim(),
        _walletType == WalletType.ethereum ? 'ethereum' : 'bitcoin',
      );

      final walletBoxes = HiveBoxes.getWalletBoxes();
      walletBoxes.add(wallet);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Add New Wallet')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.height * 0.01),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter wallet address'),
                SizedBox(height: size.height * 0.01),
                Form(
                  key: _addressFormKey,
                  child: TextFormField(
                    validator: (input) =>
                        FormValidation().validateWalletAddress(input),
                    controller: _addressTextController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter wallet label'),
                SizedBox(height: size.height * 0.01),
                Form(
                  key: _labelFormKey,
                  child: TextFormField(
                    validator: (input) =>
                        FormValidation().validateWalletLabel(input),
                    controller: _labelTextController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width * 0.4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child: WalletCard(walletModel: _ethereumWallet)),
                      Radio<WalletType>(
                        value: WalletType.ethereum,
                        groupValue: _walletType,
                        onChanged: (WalletType value) {
                          setState(() {
                            _walletType = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.3,
                  width: size.width * 0.4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: WalletCard(walletModel: _bitcoinWallet),
                      ),
                      Radio<WalletType>(
                        value: WalletType.bitcoin,
                        groupValue: _walletType,
                        // onChanged: (WalletType value) {
                        //   setState(() {
                        //     _walletType = value;
                        //   });
                        // },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              child: Text('Add Wallet'),
              onPressed: () => _addWallet(),
            ),
            SizedBox(height: size.height * 0.01),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                primary: Colors.grey,
              ),
              child: Text('Go back'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
