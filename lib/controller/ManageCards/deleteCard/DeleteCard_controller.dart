import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class DeletecardController extends GetxController {
  void confirm();

  Future<void> confirmApi();
}

class logincontrollerImp extends DeletecardController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController cardNumber;
  late TextEditingController cardPin;
  bool isshowpassword = true;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  void onInit() {
    cardNumber = TextEditingController();
    cardPin = TextEditingController();
    super.onInit();
  }

  @override
  void confirm() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      print(cardNumber.text);
      print(cardPin.text);

      confirmApi();
    } else {
      print("Not Valid");
    }
  }

  @override
  Future<void> confirmApi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
      request.body =
          json.encode({"phone": cardNumber.text, "password": cardPin.text});
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
    cardPin.dispose();
    super.dispose();
  }
}
