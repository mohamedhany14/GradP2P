import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/ManageCards/SelectBank_controller.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddcardController extends GetxController {
  void addNCard();

  Future<void> addCardApi();
}

class AddcardControllerImp extends AddcardController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController cardNumber;
  late TextEditingController fullName;
  late TextEditingController ccv;
  late TextEditingController date;
  late TextEditingController cardPin;
  var selectedBank = ''.obs;

  bool isshowpassword2 = true;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final BankSelectionController bankSelectionController =
      Get.find(); // Find the BankSelectionController
  void showhidePassword2() {
    isshowpassword2 = !isshowpassword2;
    update();
  }

  @override
  void addNCard() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      Get.offAllNamed(AppRoute.manageCards);
      //  addCardApi();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    fullName = TextEditingController();
    cardNumber = TextEditingController();
    ccv = TextEditingController();
    date = TextEditingController();
    cardPin = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> addCardApi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/signup'));
      request.body = json.encode({
        "name": fullName.text,
        "cardNumber": cardNumber.text,
        "ccv": ccv.text,
        "date": date.text,
        "cardPin": cardPin.text,
        "bank": bankSelectionController.selectedBank.value
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final token =
            jsonResponse['token']; // Extract the token from the response

        // Save token in SharedPreferences
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);

        print("Token saved: $token");
        //getCode();
        Get.offAllNamed(AppRoute.manageCards);
      } else {
        print(response.reasonPhrase);
        Get.snackbar("Error", response.reasonPhrase!);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void dispose() {
    cardNumber.dispose();
    fullName.dispose();
    ccv.dispose();
    date.dispose();
    cardPin.dispose();

    super.dispose();
  }
}
