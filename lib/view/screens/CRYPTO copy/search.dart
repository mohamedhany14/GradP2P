import 'package:flutter/material.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/data/model/coinModel.dart';
import 'package:gradp2p/view/widget/CryptoComponents/item3.dart';

import 'package:http/http.dart' as http;

class searchList extends StatefulWidget {
  const searchList({super.key});

  @override
  State<searchList> createState() => _searchListState();
}

class _searchListState extends State<searchList> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: myWidth * 0.03),
      child: isRefreshing == true
          ? Center(
              child: CircularProgressIndicator(
                color: kColor1,
              ),
            )
          : coinMarket == null || coinMarket!.length == 0
              ? Padding(
                  padding: EdgeInsets.all(myHeight * 0.06),
                  child: Center(
                    child: Text(
                      'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: coinMarket!.length,
                  itemBuilder: (context, index) {
                    return item3(
                      item: coinMarket![index],
                    );
                  },
                ),
    );
  }

  bool isRefreshing = true;

  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    setState(() {
      isRefreshing = true;
    });
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    setState(() {
      isRefreshing = false;
    });
    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }
}
