import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/ManageCards/GetCards_controller.dart';
import 'package:gradp2p/controller/ManageCards/deleteCard_controller.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/view/screens/ManageCards/addCard.dart';
import 'package:gradp2p/view/screens/test.dart';
import 'package:gradp2p/view/widget/cards/SetDefoultCard.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:gradp2p/view/widget/cards/defoultCard.dart';
import 'package:gradp2p/view/widget/homeContainers/homeCreditcardContainer.dart';

class manageCards extends StatelessWidget {
  manageCards({super.key});

  final List<Map<String, dynamic>> dataList = [
    {'text': 'Add Card ', 'imageUrl': 'assets/images/Icon Plus.png'},
    {'text': 'Delete Account', 'imageUrl': 'assets/images/Archive.png'},
    {'text': 'Check Balance', 'imageUrl': 'assets/images/Bank Card.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final GetcardsControllerImp cardsController =
        Get.put(GetcardsControllerImp());
    final DeletecardControllerImp deletecardController =
        Get.put(DeletecardControllerImp());

    // Fetch cards when the screen is loaded
    cardsController.GetCards();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Cards'),
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
            Defoultcard(),
            const SizedBox(height: 40),
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
                          Get.dialog(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Material(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            const Text(
                                              "Alert",
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 15),
                                            const Text(
                                              "Are you sure to delete the default card?",
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 20),
                                            // Buttons
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    child: const Text('Cancel'),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          const Color(
                                                              0xFFFFFFFF),
                                                      backgroundColor:
                                                          Colors.blueAccent,
                                                      minimumSize:
                                                          const Size(0, 45),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    child:
                                                        const Text('Confirm'),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          Colors.white,
                                                      backgroundColor:
                                                          Colors.red,
                                                      minimumSize:
                                                          const Size(0, 45),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      deletecardController
                                                          .DeleteCard();
                                                      Get.back();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else if (index == 2) {
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
                              Image.asset(dataList[index]['imageUrl']),
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
            Padding(
              padding: EdgeInsets.only(bottom: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custombuttonauth(
                      buttonName: "Recharge",
                      onPressed: () {
                        Get.toNamed(AppRoute.Recharge);
                      }),
                  Custombuttonauth(
                      buttonName: "Withdraw",
                      onPressed: () {
                        Get.toNamed(AppRoute.Withdrow);
                      }),
                ],
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
              ],
            ),
            SizedBox(
              height: height / 4,
              child: SetdefoultCard(),
            ),
          ],
        ),
      ),
    );
  }
}
