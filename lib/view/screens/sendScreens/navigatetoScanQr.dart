import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/recieve/recieveByPaymentAdress_controller.dart';
import 'package:gradp2p/controller/send/sendByPaymentAdress_controller.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/screens/bottomNavBar.dart';
import 'package:gradp2p/view/widget/auth/customphonefield.dart';
import 'package:gradp2p/view/widget/auth/customtextformfield.dart';
import 'package:gradp2p/view/widget/send&recieve/customAmountField.dart';
import 'package:gradp2p/view/widget/send&recieve/customConfirmButton.dart';

class Navigatetoqrgenerate extends StatelessWidget {
  const Navigatetoqrgenerate({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Customconfirmbutton(
            buttonName: 'Confirm',
            onPressed: () {
              Get.toNamed(AppRoute.ScanQRScreen);
            },
          ),
        ],
      ),
    );
  }
} 
