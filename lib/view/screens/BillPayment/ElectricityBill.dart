import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/BillPayment/Electricity_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/send&recieve/customAmountField.dart';
import 'package:gradp2p/view/widget/send&recieve/customConfirmButton.dart';

class Electricitybill extends StatelessWidget {
  final ElectricityControllerImp controller =
      Get.put(ElectricityControllerImp());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200], // Change to your `schafoldGrey` color
      appBar: AppBar(
        title: Text('Electricity bill'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 18, top: 5),
                      child: Row(
                        children: [
                          Text(
                            "Select Provider ",
                            style: TextStyle(
                              color: Colors
                                  .black, // Change to your `TextColor2` color
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(),
                    Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      width: double.infinity,
                      height: 170,
                      child: ListView.builder(
                        itemCount: controller.EProvidersList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: GestureDetector(
                              onTap: () {
                                controller.changeIndex(index);
                              },
                              child: Obx(
                                () => Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.7),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                        color: controller.current.value == index
                                            ? Colors.white70
                                            : Colors.white54,
                                        borderRadius:
                                            controller.current.value == index
                                                ? BorderRadius.circular(15)
                                                : BorderRadius.circular(10),
                                        border:
                                            controller.current.value == index
                                                ? Border.all(
                                                    color: Colors
                                                        .blue, // Change to your `kColor1` color
                                                    width: 2,
                                                  )
                                                : Border.all(
                                                    color:
                                                        schafoldGrey, // Change to your `schafoldGrey` color
                                                    width: 2,
                                                  ),
                                      ),
                                      child: Image.asset(
                                        controller.EProvidersList[index]
                                            ['imageUrl'],
                                      ),
                                    ),
                                    Text(
                                      controller.EProvidersList[index]['text'],
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
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Obx(() => Visibility(
                    visible: controller.current.value <
                        controller.EProvidersList.length,
                    child: Form(
                      key: controller.formstate,
                      child: Container(
                        height: height / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: height * 0.7 / 3,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      controller.EProvidersList[
                                          controller.current.value]['text'],
                                      style: const TextStyle(
                                        color: Colors
                                            .black, // Change to your `TextColor2` color
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    CustomAmountfield(
                                      valid: (val) {
                                        return validInput(val!, 1, 6, "amount");
                                      },
                                      labeltext: controller.EProvidersList[
                                              controller.current.value]
                                          ['TextFieldLabel'],
                                      prefix: Icon(
                                        Icons.format_list_numbered_rtl_sharp,
                                      ),
                                      mycontroller: controller.number,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Customconfirmbutton(
                              buttonName: 'Pay',
                              onPressed: () {
                                controller.Pay();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
