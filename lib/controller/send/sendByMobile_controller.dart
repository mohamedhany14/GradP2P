import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class SendbymobileController extends GetxController {
  sendMoney();

  Sendbymobile();
}

class SendbymobileControllerImp extends SendbymobileController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController mobilenumber;
  late TextEditingController amount;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  sendMoney() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      print(mobilenumber);
      print(amount);
      Sendbymobile();

     
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    mobilenumber = TextEditingController();
    amount = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Sendbymobile() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final token = prefs.getString('token');

      if (token == null) {
        Get.snackbar("Error", "Token not found. Please login again.");
        return;
      }
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/transactions/send'));
      request.body =
          json.encode({"phone": mobilenumber.text, "amount": amount.text});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      
        Get.offAllNamed(AppRoute.Bottomnavbar);
         Get.snackbar("succes", "send succesfully.");
      } else {
        print(response.reasonPhrase);
            Get.snackbar("Erorr", "send  failed");
      }
    } catch (e) {
      Get.snackbar("Exeption", e.toString());
    }
  }

  @override
  void dispose() {
    mobilenumber.dispose();
    amount.dispose();

    super.dispose();
  }
}
