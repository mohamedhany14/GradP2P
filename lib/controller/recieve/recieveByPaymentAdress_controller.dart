import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class RecievebypaymentAdressController extends GetxController {
  RecieveMoney();

 RecievebyPaymentAdress();
}

class  RecievebypaymentAdressControllerImp extends  RecievebypaymentAdressController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController paymentAdress;
  late TextEditingController amount;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  RecieveMoney() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      print(paymentAdress);
      print(amount);
      Get.offAllNamed(AppRoute.Bottomnavbar);
      // logiWithPhone();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    paymentAdress = TextEditingController();
    amount = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> RecievebyPaymentAdress() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
      request.body =
          json.encode({"paymentAdress": paymentAdress.text, "amount": amount.text});
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
    paymentAdress.dispose();
    amount.dispose();

    super.dispose();
  }
}
