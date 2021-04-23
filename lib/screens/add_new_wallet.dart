import 'package:cactus_wallet_watcher/state_management/class_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewWallet extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _textEditingController = TextEditingController();

  void addWallet(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      await context
          .read(sharedPrefProvider)
          .saveWallet(_textEditingController.text.trim());
      _textEditingController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Add New Wallet')),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.01),
        child: Column(
          children: [
            Text('Add a new Ethereum wallet to watch.'),
            SizedBox(height: size.height * 0.05),
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (input) =>
                    input.isEmpty ? 'Enter wallet address' : null,
                controller: _textEditingController,
                decoration: InputDecoration(),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            ElevatedButton(
              child: Text('Add Wallet'),
              onPressed: () => addWallet(context),
            ),
          ],
        ),
      ),
    );
  }
}
