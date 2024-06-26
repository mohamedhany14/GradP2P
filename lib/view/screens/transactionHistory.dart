import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/view/widget/homeContainers/lastTransactions.dart';

class transaction extends StatelessWidget {
  const transaction({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
        centerTitle: true, // Center the title horizontally
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ), // Leading arrow icon
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return transactionContainer();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
