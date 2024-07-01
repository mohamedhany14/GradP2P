import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/bottomNavBar_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/view/screens/ManageCards/manageCards.dart';
import 'package:gradp2p/view/screens/dashboard.dart';
import 'package:gradp2p/view/screens/home%20.dart';

class Bottomnavbar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    Home(),
    Dashboard(),
    manageCards(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          backgroundColor: kColor1,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            controller.changeIndex(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/tabler_credit-card.png'),
                size: 30,
              ),
              label: "My Cards",
            ),
          ],
        ),
      ),
    );
  }
}
