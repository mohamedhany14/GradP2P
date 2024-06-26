import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ElectricityController extends GetxController {
  Pay();

  Payapi();
}

class ElectricityControllerImp extends ElectricityController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController number;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> EProvidersList = [
    {
      'text': 'South Cairo',
      'text2': 'South Cairo',
      'TextFieldLabel': 'E-Payment Code',
      'imageUrl': 'assets/images/South Cairo E.jpeg',
    },
    {
      'text': 'North Cairo',
      'text2': 'North Cairo',
      'TextFieldLabel': 'Payment Code',
      'imageUrl': 'assets/images/North Cairo E.jpeg',
    },
    {
      'text': 'Canal Electricity',
      'text2': 'Canal Electricity',
      'TextFieldLabel': 'Subscriber ID',
      'imageUrl': 'assets/images/Canal Electricity E.png',
    },
    {
      'text': 'Alexandria Electricty',
      'text2': 'Alexandria Electricty',
      'TextFieldLabel': 'E-Code(16-Digits)',
      'imageUrl': 'assets/images/Alexandria Electricty E.jpeg',
    },
    {
      'text': 'South Delta Electricity',
      'text2': 'South Delta Electricity',
      'TextFieldLabel': 'Subscriber ID(13-Digits)',
      'imageUrl': 'assets/images/South Delta Electricity E.jpeg',
    },
    {
      'text': 'Upper Egypt Electricity',
      'text2': 'Upper Egypt Electricity',
      'TextFieldLabel': 'E-Payment Code(16-Digits)',
      'imageUrl': 'assets/images/Upper Egypt Electricity E.jpeg',
    },
    {
      'text': 'North Delta Electricity',
      'text2': 'North Delta Electricity',
      'TextFieldLabel': 'Payment Code(13-Digits after /)',
      'imageUrl': 'assets/images/North Delta Electricity E.jpeg',
    },
    {
      'text': 'TAQA Power',
      'text2': 'TAQA Power',
      'TextFieldLabel': 'Electricity Meter Number.',
      'imageUrl': 'assets/images/taqa_arabia_logo.jpeg',
    },
    {
      'text': 'Injaz Electricity',
      'text2': 'Injaz Electricity',
      'TextFieldLabel': 'Bill Nubmer.',
      'imageUrl': 'assets/images/Injaz Electricity E.png',
    },
    {
      'text': 'Middle Egypt Electricity',
      'text2': 'Middle Egypt Electricity',
      'TextFieldLabel': 'Subscription Number(10-Digits)',
      'imageUrl': 'assets/images/Middle Egypt Electricity E.jpeg',
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

      print(number);
      Get.offAllNamed(AppRoute.Bottomnavbar);
      // logiWithPhone();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    number = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Payapi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
      request.body = json.encode({"number": number.text});
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
    number.dispose();

    super.dispose();
  }
}
