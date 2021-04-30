import 'package:cactus_wallet_watcher/models/wallet_model.dart';
import 'package:cactus_wallet_watcher/services/form_validation.dart';
import 'package:cactus_wallet_watcher/services/hive_boxes.dart';
import 'package:cactus_wallet_watcher/services/niche_functions.dart';
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
  final _nicheFunctions = NicheFunctions();
  final _formValidator = FormValidation();

  WalletType _walletType = WalletType.ethereum;

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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.015),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Wallet address'),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _addressFormKey,
                        child: TextFormField(
                          validator: (input) =>
                              _formValidator.validateWalletAddress(input),
                          controller: _addressTextController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: size.height * 0.05,
                      ),
                      onPressed: () {
                        _nicheFunctions.showToast('Coming soon!');
                      },
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Text('Wallet label'),
                SizedBox(height: size.height * 0.01),
                Form(
                  key: _labelFormKey,
                  child: TextFormField(
                    validator: (input) =>
                        _formValidator.validateWalletLabel(input),
                    controller: _labelTextController,
                    textCapitalization: TextCapitalization.words,
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
            Text(
              'Select Wallet Type',
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: buildWalletCard(
                    context,
                    _walletType == WalletType.ethereum,
                    'ethereum',
                  ),
                  onTap: () {
                    setState(() {
                      _walletType = WalletType.ethereum;
                    });
                  },
                ),
                InkWell(
                  child: buildWalletCard(
                    context,
                    _walletType == WalletType.bitcoin,
                    'bitcoin',
                  ),
                  onTap: () {
                    _nicheFunctions.showToast('Coming soon!');
                  },
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width, size.height * 0.06),
              ),
              child: Text('Add Wallet'),
              onPressed: () => _addWallet(),
            ),
          ],
        ),
      ),
    );
  }

  Container buildWalletCard(
      BuildContext context, bool walletType, String wallet) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.3,
      width: size.width * 0.4,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:
              walletType ? Theme.of(context).accentColor : Colors.transparent,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: _nicheFunctions.getWalletImage(wallet, size),
    );
  }
}
