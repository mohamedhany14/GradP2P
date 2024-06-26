import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:gradp2p/view/screens/CRYPTO%20copy/selectCoin.dart';

class item3 extends StatelessWidget {
  var item;
  item3({this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myWidth * 0.02, vertical: myHeight * 0.025),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contest) => SelectCoin(
                        selectItem: item,
                      )));
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    height: myHeight * 0.05, child: Image.network(item.image)),
              ),
              SizedBox(
                width: myWidth * 0.02,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.id,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '0.4 ' + item.symbol,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: myWidth * 0.01,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: myHeight * 0.05,
                  width: myWidth * 0.2,
                  child: Sparkline(
                    data: item.sparklineIn7D.price,
                    lineWidth: 2.0,
                    lineColor: item.marketCapChangePercentage24H >= 0
                        ? Colors.green
                        : Colors.red,
                    fillMode: FillMode.below,
                    fillGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 0.7],
                        colors: item.marketCapChangePercentage24H >= 0
                            ? [Colors.green, Colors.green.shade100]
                            : [Colors.red, Colors.red.shade100]),
                  ),
                ),
              ),
              SizedBox(
                width: myWidth * 0.02,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ' + item.currentPrice.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
