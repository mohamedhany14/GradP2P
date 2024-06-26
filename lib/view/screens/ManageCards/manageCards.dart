import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/view/screens/ManageCards/addCard.dart';
import 'package:gradp2p/view/screens/ManageCards/changePin/interPin.dart';
import 'package:gradp2p/view/screens/ManageCards/deleteCard.dart';
import 'package:gradp2p/view/screens/ManageCards/forgotPin.dart';
import 'package:gradp2p/view/screens/test.dart';
import 'package:gradp2p/view/widget/homeContainers/homeCreditcardContainer.dart';

class manageCards extends StatelessWidget {
  manageCards({super.key});

  final List<Map<String, dynamic>> dataList = [
    {'text': 'Add Card ', 'imageUrl': 'assets/images/Icon Plus.png'},
    {'text': 'Delete Account', 'imageUrl': 'assets/images/Archive.png'},
    {'text': ' Check Balance', 'imageUrl': 'assets/images/Bank Card.png'},
    {'text': 'Change Password', 'imageUrl': 'assets/images/Download.png'},
    {'text': ' Forget Password', 'imageUrl': 'assets/images/Pen.png'},
    {
      'text': 'Transactions ',
      'imageUrl': 'assets/images/Horizontal_switch_light.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mange Cards'),
        centerTitle: true, // Center the title horizontally
        leading: IconButton(
          icon: const Icon(
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
            CreditCardContainer(),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                  ),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          // Get.toNamed(AppRoute.manageCards);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addCard()));
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const deleteCard()));
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Test()));
                        } else if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const interPin()));
                        } else if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const forgotPin()));
                        } else if (index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Test()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Test()));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 91.0,
                          height: 109.0,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F9FA),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1.06, color: Color(0xFFEFF1F4)),
                              borderRadius: BorderRadius.circular(14.89),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x423A7BF8),
                                blurRadius: 40,
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                dataList[index]['imageUrl'],
                              ),
                              Text(
                                dataList[index]['text'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF3177FF),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Other Accounts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.05,
                    ),
                  ),
                  SizedBox(),
                ]),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const CreditCardContainer();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
