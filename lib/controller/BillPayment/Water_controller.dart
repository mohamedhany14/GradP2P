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
      'email': 'AlexWater@smartpay.com'
    },
    {
      'text': 'Cairo Water',
      'TextFieldLabel': 'E-Payment Code(14-Digits)',
      'imageUrl': 'assets/images/we.png',
      'email': 'CairoWater@smartpay.com'
    },
    {
      'text': 'Giza Water',
      'TextFieldLabel': 'Account Number(9-Digits)',
      'imageUrl': 'assets/images/we.png',
      'email': 'GizaWater@smartpay.com'
    },
    {
      'text': 'Suez Canal Authority',
      'TextFieldLabel': 'Subscription number',
      'imageUrl': 'assets/images/we.png',
      'email': 'SuezCanal@smartpay.com'
    },
    {
      'text': 'AlexWater',
      'TextFieldLabel': 'E-Payment Code(6-Digits)',
      'imageUrl': 'assets/images/we.png',
      'email': 'AlexWater@smartpay.com'
    },
    {
      'text': 'Damitte Water Company',
      'TextFieldLabel': 'Client ID',
      'imageUrl': 'assets/images/we.png',
      'email': 'DamitteWater@smartpay.com'
    },
    {
      'text': 'Minya Water Company',
      'TextFieldLabel': 'Subscription Number',
      'imageUrl': 'assets/images/we.png',
      'email': 'MinyaWater@smartpay.com'
    },
    {
      'text': 'Matrouh Water Company',
      'TextFieldLabel': 'Subscription Number',
      'imageUrl': 'assets/images/we.png',
      'email': 'MatrouhWater@smartpay.com'
    },
    {
      'text': 'Red Sea Water Company',
      'TextFieldLabel': 'Subscription Number',
      'imageUrl': 'assets/images/we.png',
      'email': 'RedSeaWater@smartpay.com'
    },
    {
      'text': 'Fayoum Drinking and Water',
      'TextFieldLabel': 'Subscription Number',
      'imageUrl': 'assets/images/we.png',
      'email': 'FayoumWater@smartpay.com'
    },
  ];

  String selectedProviderEmail = '';
  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = WProvidersList[index]['email'];
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      Payapi();
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
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://smart-pay.onrender.com/api/v0/transactions/transfer'));
      request.body = json.encode({
        "smartEmail": selectedProviderEmail.toString(),
        "amount": 300,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        print(selectedProviderEmail);
        Get.offAllNamed(AppRoute.Bottomnavbar);
      } else {
        print(response.reasonPhrase);
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
