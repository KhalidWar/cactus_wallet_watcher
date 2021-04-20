import 'package:cactus_wallet_watcher/confidential.dart';
import 'package:cactus_wallet_watcher/services/api_services.dart';
import 'package:cactus_wallet_watcher/shared_components/token_list_header.dart';
import 'package:cactus_wallet_watcher/shared_components/token_list_tile.dart';
import 'package:cactus_wallet_watcher/shared_components/wallet_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    APIServices().getAccountBalance(kMetaMask).then((value) {
      print(value.result);
    });
    APIServices().getTxList(kMetaMask).then((value) {
      // print(value.result[0].value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: PageView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
            children: [
              WalletHeader(title: 'Ethereum Wallet', value: 12000),
              Divider(),
              TokenListHeader(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return TokenListTile();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text('Wallet Watcher'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => buildAddWallet(),
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    );
  }

  Future buildAddWallet() {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) {
        return Container();
      },
    );
  }
}
