import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class InternetController extends GetxController {
  Pay();

  Payapi();
}

class InternetControllerImp extends InternetController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController PhoneNumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> DSLProvidersList = [
    {
      'text': ' We',
      'text2': 'WE-Home Internet Invoice',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Vodafone',
      'text2': 'Vodafone ADSL',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/vodafone.png',
    },
    {
      'text': 'Etisalat',
      'text2': 'Etisalat ADSL',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/Etisalat.png',
    },
    {
      'text': 'Orange DSL',
      'text2': 'Orange ADSL',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/orange.png',
    },
    {
      'text': 'noor DSL',
      'text2': 'noor ADSL',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/Noor adsl.jpeg',
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

      print(PhoneNumber);
      Get.offAllNamed(AppRoute.Bottomnavbar);
      // logiWithPhone();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    PhoneNumber = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Payapi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
      request.body = json.encode({"PhoneNumber": PhoneNumber.text});
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
    PhoneNumber.dispose();

    super.dispose();
  }
}
