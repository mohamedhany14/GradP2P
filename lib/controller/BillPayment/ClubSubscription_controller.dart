import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ClubsubscriptionController extends GetxController {
  Pay();

  Payapi();
}

class ClubsubscriptionControllerImp extends ClubsubscriptionController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController subscribeNumber;
  late TextEditingController MobileNumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> ClubsList = [
    {
      'text': 'Matrix Sports Club',
      'text2': 'Matrix Sports Club Membership Installment',
      'TextFieldLabel': 'Subscription Number',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Matrix Sports Club.png',
    },
    {
      'text': 'Matrix Sports Club',
      'text2': 'Matrix Sports Club Membership Renewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Matrix Sports Club.png',
    },
    {
      'text': 'Elshams Club',
      'text2': 'Elshams Club Membership Installment',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Elshams Club.jpeg',
    },
    {
      'text': 'Elshams Club',
      'text2': 'Elshams Club Membership Renewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Elshams Club.jpeg',
    },
    {
      'text': 'Shooting Club',
      'text2': 'Shooting Club Membership Installment',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Shooting Club.png',
    },
    {
      'text': 'Shooting Club',
      'text2': 'Shooting Club Membership Renewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Shooting Club.png',
    },
    {
      'text': 'Ismaily Club',
      'text2': 'Ismaily Club Membership Installment',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Ismaily Club.png',
    },
    {
      'text': 'Ismaily Club',
      'text2': 'Ismaily Club Membership Renewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Ismaily Club.png',
    },
    {
      'text': 'Alahly Club',
      'text2': 'Alahly Club Membership Installment',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Alahly Club.png',
    },
    {
      'text': 'Alahly Club',
      'text2': 'Alahly Club Membership Renwewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Alahly Club.png',
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
