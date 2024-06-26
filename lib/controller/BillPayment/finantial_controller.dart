import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class FinantialController extends GetxController {
  Pay();

  Payapi();
}

class FinantialControllerImp extends FinantialController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController MobileNumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> FinancialList = [
    {
      'text': 'Valu Company',
      'text2': 'Valu Company',
      'TextFieldLabel': 'Mobile Number',
      'imageUrl': 'assets/images/Financial/Valu Company.jpeg',
    },
    {
      'text': 'B.TECH',
      'text2': 'B.TECH',
      'TextFieldLabel': 'Payment Code(7-Digits)',
      'imageUrl': 'assets/images/Financial/B.TECH.png',
    },
    {
      'text': 'Contact',
      'text2': 'Contact',
      'TextFieldLabel': 'National ID',
      'imageUrl': 'assets/images/Financial/Contact.png',
    },
    {
      'text': 'Souhoola',
      'text2': 'Souhoola',
      'TextFieldLabel': 'National ID',
      'imageUrl': 'assets/images/Financial/Souhoola.png',
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

      print(MobileNumber);
      Get.offAllNamed(AppRoute.Bottomnavbar);
      // logiWithPhone();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    MobileNumber = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Payapi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
      request.body = json.encode({"number": MobileNumber.text});
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
    MobileNumber.dispose();
    super.dispose();
  }
}
