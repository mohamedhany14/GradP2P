import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/send/sendByCard_controller.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/customphonefield.dart';
import 'package:gradp2p/view/widget/auth/customtextformfield.dart';
import 'package:gradp2p/view/widget/send&recieve/customAmountField.dart';
import 'package:gradp2p/view/widget/send&recieve/customConfirmButton.dart';

class sendToCard extends StatelessWidget {
  const sendToCard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    SendbyCardControllerImp controller = Get.put(SendbyCardControllerImp());
    return Form(
      key: controller.formstate,
      child: Container(
        height: height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Customphonefield(
                  valid: (val) {
                    return validInput(val!, 16, 16, "cardnumber");
                  },
                  labeltext: "card number  ",
                  prefix: Icon(
                    Icons.credit_card,
                  ),
                  mycontroller: controller.cardnumber,
                ),
                SizedBox(
                  height: 20,
                ),
                Customtextformfield(
                  labeltext: "card Holder Name",
                  iconData: Icons.credit_card,
                  mycontroller: controller.cardHoldername,
                  valid: (val) {
                    return validInput(val!, 10, 30, "card Holder Name");
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomAmountfield(
                  valid: (val) {
                    return validInput(val!, 1, 6, "amount");
                  },
                  labeltext: "Enter amount ",
                  prefix: Icon(
                    Icons.attach_money_outlined,
                  ),
                  mycontroller: controller.amount,
                ),
              ],
            ),
            Customconfirmbutton(
              buttonName: 'Confirm',
              onPressed: () {
                controller.sendMoney();
              },
            ),
          ],
        ),
      ),
    );
  }
}
