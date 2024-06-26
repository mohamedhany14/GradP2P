import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class EducationController extends GetxController {
  Pay();

  Payapi();
}

class EducationControllerImp extends EducationController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController studentID;
  late TextEditingController NationalID;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> EducationProvidersList = [
    {
      'text': 'Cairo Univesity',
      'text2': 'Cairo University Tuitions',
      'TextFieldLabel': 'Student ID',
      'imageUrl': 'assets/images/education/Cairo Univesity.jpeg',
    },
    {
      'text': 'American School',
      'text2': 'American School Tuitions',
      'TextFieldLabel': 'Student ID',
      'imageUrl': 'assets/images/education/American School.png',
    },
    {
      'text': '30 June schools ',
      'text2': 'American School Tuitions',
      'TextFieldLabel': 'Student ID',
      'TextFieldLabel2': 'National ID',
      'imageUrl': 'assets/images/education/30 June schools.png',
    },
    {
      'text': 'Ain Shams University',
      'text2': 'Ain Shams University Tuitions',
      'TextFieldLabel': 'Student ID',
      'imageUrl': 'assets/images/education/Ain Shams University.png',
    },
    {
      'text': 'Nile University',
      'text2': 'Nile University Tuitions',
      'TextFieldLabel': 'National ID',
      'TextFieldLabel2': 'Name',
      'imageUrl': 'assets/images/education/Nile University.png',
    },
    {
      'text': 'Egyptian E-learing',
      'text2': 'Egyptian E-learing Tuitions',
      'TextFieldLabel': 'Student ID',
      'imageUrl': 'assets/images/education/Egyptian E-learing.jpeg',
    },
    {
      'text': 'International Academy',
      'text2': 'International Academy Tuitions',
      'TextFieldLabel': 'Student ID',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': 'Mina University',
      'text2': 'Mina University Tuitions',
      'TextFieldLabel': 'Student ID',
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

      print(studentID);
      print(NationalID);
      Get.offAllNamed(AppRoute.Bottomnavbar);
      // logiWithPhone();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    studentID = TextEditingController();
    NationalID = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Payapi() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
      request.body =
          json.encode({"number": studentID.text, "number": NationalID.text});
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
    studentID.dispose();
    NationalID.dispose();
    super.dispose();
  }
}
