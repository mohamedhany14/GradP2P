import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class DonationsController extends GetxController {
  Donate();

  Donateapi();
}

class DonationsControllerImp extends DonationsController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController amount;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  List<Map<String, dynamic>> donationsList = [
    {
      'text': 'Bayt Al Zakat',
      'imageUrl': 'assets/images/Bayt Al Zakat.jpeg',
    },
    {
      'text': '57357',
      'imageUrl': 'assets/images/57357.png',
    },
    {
      'text': 'Resala',
      'imageUrl': 'assets/images/Resala.png',
    },
    {
      'text': 'Abou elRich ElMonera',
      'imageUrl': 'assets/images/Abou elRich ElMonera.jpeg',
    },
    {
      'text': 'El Nas Hospital ',
      'imageUrl': 'assets/images/El Nas Hospital.png',
    },
    {
      'text': 'Egyption Food Bank',
      'imageUrl': 'assets/images/Egyption Food Bank.jpeg',
    },
    {
      'text': 'Misr Elkheir',
      'imageUrl': 'assets/images/Misr Elkheir.png',
    },
    {
      'text': 'Baheya',
      'imageUrl': 'assets/images/Baheya.png',
    },
    {
      'text': 'Mersal Foundation',
      'imageUrl': 'assets/images/Mersal Foundation.png',
    },
  ];

  void changeIndex(int index) {
    current.value = index;
  }

  @override
  Donate() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      print(amount);
      Get.offAllNamed(AppRoute.Bottomnavbar);
      // logiWithPhone();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    amount = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Donateapi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
      request.body = json.encode({"amount": amount.text});
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
    amount.dispose();

    super.dispose();
  }
}
