import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class WaterController extends GetxController {
  Pay();

  Payapi();
}

class WaterControllerImp extends WaterController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController subnumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

   final List<Map<String, dynamic>> WProvidersList = [
    {
      'text': 'AlexWater',
      'TextFieldLabel': 'E-Payment Code(14-Digits)',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Cairo Water',
      'TextFieldLabel': 'E-Payment Code(14-Digits)',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Giza Water',
      'TextFieldLabel': 'Account Number(9-Digits)',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Suez Canal Authority',
      'TextFieldLabel': 'Subscription number',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'AlexWater',
      'TextFieldLabel': 'E-Payment Code(6-Digits)',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Damitte Water Company',
      'TextFieldLabel': 'Client ID',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Minya Water Company',
      'TextFieldLabel': 'Subscription Number',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Matrouh Water Company',
      'TextFieldLabel': 'Subscription Number',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Red Sea Water Company',
      'TextFieldLabel': 'Subscription Number',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Fayoum Drinking and Water',
      'TextFieldLabel': 'Subscription Number',
      'imageUrl': 'assets/images/we.png',
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

      print(subnumber);
      Get.offAllNamed(AppRoute.Bottomnavbar);
      // logiWithPhone();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    subnumber = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Payapi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
      request.body = json.encode({"number": subnumber.text});
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
    subnumber.dispose();

    super.dispose();
  }
}
