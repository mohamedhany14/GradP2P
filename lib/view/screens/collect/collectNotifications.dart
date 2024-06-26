import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/core/constants/routes.dart';

class CollectNoti extends StatelessWidget {
  CollectNoti({super.key});
  final List<Map<String, dynamic>> dataList = [
    {
      'requestType': 'collect money',
      'adress': 'mohamedhany@smartpay.com',
      'amount': '100',
    },
    {
      'requestType': 'collect money',
      'adress': 'mohamedhany@smartpay.com',
      'amount': '100',
    },
    {
      'requestType': 'collect money',
      'adress': 'mohamedhany@smartpay.com',
      'amount': '100',
    },
    {
      'requestType': 'collect money',
      'adress': 'mohamedhany@smartpay.com',
      'amount': '100',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collect notifications'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                      Get.toNamed(AppRoute.DonationsScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFF5163BF)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dataList[index]['adress'],
                              style: const TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Request type : ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  dataList[index]['requestType'],
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Amount : ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  dataList[index]['amount'],
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
