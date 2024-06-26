import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/auth/SlelectCity_controller.dart';
import 'package:gradp2p/controller/auth/forgotPassword/SlelectGender_controller.dart';
import 'package:gradp2p/controller/auth/signup_controller.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:gradp2p/view/widget/auth/custompasstextformfield.dart';
import 'package:gradp2p/view/widget/auth/customphonefield.dart';

import 'package:gradp2p/view/widget/auth/customtextformfield.dart';
import 'package:gradp2p/view/widget/auth/loginlinktext.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final SlelectgenderController genderSelectionController =
        Get.put(SlelectgenderController());

    final SlelectcityController citySelectionController =
        Get.put(SlelectcityController());

    signupcontrollerImp controller = Get.put(signupcontrollerImp());

    return Scaffold(
      body: Form(
        key: controller.formstate,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height / 13),
              Text(
                "Immediately Feel\nThe Ease of Transacting\n Just by Registering",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff2f1155),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height / 13),
              //user name text field

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Select Gender",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors
                                  .blue), // Replace with TextColor1 if defined
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      items: <String>[
                        'Male',
                        'Female',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        genderSelectionController.setSelectedgender(value!);
                      },
                      value:
                          genderSelectionController.selectedgender.value.isEmpty
                              ? null
                              : genderSelectionController.selectedgender.value,
                      validator: (value) =>
                          value == null ? 'Please select a gender' : null,
                    )),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Select Your City",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors
                                  .blue), // Replace with TextColor1 if defined
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      items: <String>[
                        'Cairo',
                        'Alex',
                        'ismailia',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        citySelectionController.setSelectedcity(value!);
                      },
                      value: citySelectionController.selectedcity.value.isEmpty
                          ? null
                          : citySelectionController.selectedcity.value,
                      validator: (value) =>
                          value == null ? 'Please select a city' : null,
                    )),
              ),

              Customtextformfield(
                valid: (val) {
                  return validInput(val!, 5, 30, "userName");
                },
                labeltext: "Full Name",
                iconData: Icons.person,
                mycontroller: controller.fullName,
              ),

              Customphonefield(
                valid: (val) {
                  return validInput(val!, 11, 11, "phonenumber");
                },
                labeltext: "Phone Number ",
                prefix: Icon(
                  Icons.mobile_friendly_rounded,
                ),
                mycontroller: controller.phoneNumber,
              ),
              //email field

              Customtextformfield(
                valid: (val) {
                  return validInput(val!, 10, 30, "Email");
                },
                labeltext: "Email",
                iconData: Icons.email_outlined,
                mycontroller: controller.email,
              ),

              //birth date field

              // const Birthdatefield(),
              // Customtextformfield(
              //   valid: (val) {
              //     return validInput(val!, 4, 7, "gender");
              //   },
              //   labeltext: "gender",
              //   iconData: Icons.email_outlined,
              //   mycontroller: controller.gender,
              // ),

              // Customtextformfield(
              //   valid: (val) {
              //     return validInput(val!, 3, 15, "city");
              //   },
              //   labeltext: "city",
              //   iconData: Icons.email_outlined,
              //   mycontroller: controller.city,
              // ),
              Customtextformfield(
                valid: (val) {
                  return validInput(val!, 4, 11, "birth date");
                },
                labeltext: "birth date",
                iconData: Icons.email_outlined,
                mycontroller: controller.birthDate,
              ),
//const Customselectgender(),

              //            const Customselectcity(),

              //password field

              GetBuilder<signupcontrollerImp>(
                builder: (controller) => Passtextformfield(
                  valid: (val) {
                    return validInput(val!, 5, 15, "password");
                  },
                  labeltext: "Password",
                  mycontroller: controller.password,
                  obscureText: controller.isshowpassword,
                  onTapIcon: () {
                    controller.showPassword();
                  },
                ),
              ),
              GetBuilder<signupcontrollerImp>(
                builder: (controller) => Passtextformfield(
                  valid: (val) {
                    return validInput(val!, 5, 15, "password");
                  },
                  labeltext: "Confirm Password",
                  mycontroller: controller.confirmPassword,
                  obscureText: controller.isshowpassword2,
                  onTapIcon: () {
                    controller.showPassword2();
                  },
                ),
              ),

              Custombuttonauth(
                buttonName: "  Register ",
                onPressed: () {
                  controller.Signup();
                },
              ),

              Loginlinktext(onTap: () {
                controller.goTologin();
              })
            ],
          ),
        ),
      ),
    );
  }
}
