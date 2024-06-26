import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

class navDrawer extends StatelessWidget {
  const navDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              // buildMenuItems(context),

              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Container(
        //color: Colors.blue,

        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),

        child: const Column(
          children: [
            SizedBox(height: 50),
            Text(
              'William Smith',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 24,
                fontFamily: 'Abel',
                fontWeight: FontWeight.w400,
                height: 0.07,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'william.smith@gmail.com',
              style: TextStyle(
                color: Color(0xFF827F7F),
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                height: 0.25,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("Home"),
                onTap: () {
                  Get.toNamed(AppRoute.Bottomnavbar);
                }),
            ListTile(
              leading: Icon(Icons.payment_outlined),
              title: Text("My wallet"),
              onTap: () {
                Get.toNamed(AppRoute.Bottomnavbar);
              },
            ),
            ListTile(
              leading: Icon(Icons.loop),
              title: Text("Transaction"),
              onTap: () {
                Get.toNamed(AppRoute.transaction);
              },
            ),
            ListTile(
              leading: Icon(Icons.grid_view_rounded),
              title: Text("Service"),
              onTap: () {
                Get.toNamed(AppRoute.Bottomnavbar);
              },
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text("Help"),
              onTap: () {
                Get.toNamed(AppRoute.Bottomnavbar);
              },
            ),
            ListTile(
              leading: Icon(Icons.help_center_rounded),
              title: Text("FAQ"),
              onTap: () {
                Get.toNamed(AppRoute.Bottomnavbar);
              },
            ),
          ],
        ),
      );
}
