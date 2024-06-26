import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BanksController extends GetxController {
  Pay();

  Payapi();
}

class BanksControllerImp extends BanksController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController subscribeNumber;
  late TextEditingController MobileNumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> BanksList = [
    {
      'text': 'Money Fellows',
      'text2': 'Money Fellows',
      'TextFieldLabel': 'Mobile Number',
      'TextFieldLabel2': 'National ID',
      'imageUrl': 'assets/images/Financial/Money Fellows.png',
    },
    {
      'text': 'ABK Bank',
      'text2': 'ABK Loan',
      'TextFieldLabel': 'National ID',
      'TextFieldLabel2': 'Loan ID',
      'imageUrl': 'assets/images/Financial/ABK Bank.png',
    },
    {
      'text': 'Mashreq Bank',
      'text2': 'Mashreq Loan',
      'TextFieldLabel': 'National ID',
      'TextFieldLabel2': 'Account Number',
      'imageUrl': 'assets/images/Financial/Mashreq Bank.jpeg',
    },
    {
      'text': 'Bank ABC',
      'text2': 'Bank ABC Loan',
      'TextFieldLabel': 'National ID',
      'TextFieldLabel2': 'Loan ID',
      'imageUrl': 'assets/images/Financial/Bank ABC.png',
    },
  ];
  void changeIndex(int index) {
    current.value = index;
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      print(subscribeNumber);
      print(MobileNumber);
      Get.offAllNamed(AppRoute.Bottomnavbar);
      // logiWithPhone();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    subscribeNumber = TextEditingController();
    MobileNumber = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Payapi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
      request.body = json.encode(
          {"number": subscribeNumber.text, "number": MobileNumber.text});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

        Get.offAllNamed(AppRoute.Bottomnavbar);
      } else {
        print(response.reasonPhrase);
        // Get.showSnackbar("eroooooor" as GetSnackBar);
      }
    } catch (e) {
      Get.snackbar("Exeption", e.toString());
    }
  }

  @override
  void dispose() {
    subscribeNumber.dispose();
    MobileNumber.dispose();
    super.dispose();
  }
}
