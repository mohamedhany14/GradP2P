import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/auth/SlelectCity_controller.dart';
import 'package:gradp2p/controller/auth/forgotPassword/SlelectGender_controller.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignupController extends GetxController {
  void Signup();
  void goTologin();
  void getCode();
  Future<void> registerWithEmail();
}

class signupcontrollerImp extends SignupController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController fullName;
  late TextEditingController phoneNumber;
  late TextEditingController email;
  // late TextEditingController gender;
  //late TextEditingController city;
  late TextEditingController birthDate;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool isshowpassword = true;
  bool isshowpassword2 = true;
  var selectedcity = ''.obs;
  var selectedgender = ''.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SlelectcityController slelectcityController = Get.find();
  final SlelectgenderController slelectgenderController = Get.find();

  void showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  void showPassword2() {
    isshowpassword2 = !isshowpassword2;
    update();
  }

  @override
  void Signup() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      registerWithEmail();
    } else {
      print("Not Valid");
    }
  }

  @override
  void goTologin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    fullName = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();
    // gender = TextEditingController();
    // city = TextEditingController();
    birthDate = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/signup'));
      request.body = json.encode({
        "name": fullName.text,
        "phone": phoneNumber.text,
        "email": email.text,
        "birthDate": birthDate.text,
        "gender": slelectgenderController.selectedgender.value,
        "city": slelectcityController.selectedcity.value,
        "password": password.text
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final token =
            jsonResponse['token']; // Extract the token from the response

        // Save token in SharedPreferences
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        print(slelectgenderController.selectedgender.value);
        print(slelectcityController.selectedcity.value);
        print("Token saved: $token");
        //getCode();
        Get.offAllNamed(AppRoute.otp);
      } else {
        print(response.reasonPhrase);
        Get.snackbar("Error", response.reasonPhrase!);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  Future<void> getCode() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final token = prefs.getString('token');

      if (token == null) {
        Get.snackbar("Error", "Token not found. Please login again.");
        return;
      }

      var headers = {'Authorization': 'Bearer$token'};
      var request = http.Request(
        'GET',
        Uri.parse(
            'https://smart-pay.onrender.com/api/v0/users/generatePhoneOtp'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("otp");
        print(await response.stream.bytesToString());
        //  Get.toNamed(AppRoute.Bottomnavbar);
      } else {
        print(response.reasonPhrase);
        Get.snackbar("Error", response.reasonPhrase!);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void dispose() {
    fullName.dispose();
    phoneNumber.dispose();
    email.dispose();

    birthDate.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}

















/**import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;

abstract class SignupController extends GetxController {
  Signup();
  goTologin();
  registerWithEmail();
}

class signupcontrollerImp extends SignupController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController fullName;
  late TextEditingController phoneNumber;
  late TextEditingController email;
  late TextEditingController gender;
  late TextEditingController city;
  late TextEditingController birthDate;
  late TextEditingController xx;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool isshowpassword = true;
  bool isshowpassword2 = true;
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  showPassword2() {
    isshowpassword2 = isshowpassword2 == true ? false : true;
    update();
  }

  @override
  Signup() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      registerWithEmail();
    } else {
      print("Not Valid");
    }
  }

  @override
  goTologin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    fullName = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();
    gender = TextEditingController();
    city = TextEditingController();
    birthDate = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/signup'));
      request.body = json.encode({
        "name": fullName.text,
        "phone": phoneNumber.text,
        "email": email.text,
        "birthDate": birthDate.text,
        "gender": gender.value.text,
        "city": city.value.text,
        "password": password.text
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        print("successsssssssssssssssssssssssssssss");
        Get.offAllNamed(AppRoute.otp);
      } else {
        print(response.reasonPhrase);
        print("erorrrrrrr");
      }
    } catch (e) {
      Get.snackbar("Exeption", e.toString());
    }
  }

  @override
  void dispose() {
    fullName.dispose();
    phoneNumber.dispose();
    email.dispose();
    gender.dispose();
    city.dispose();
    birthDate.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
 */





/**
     try {
      var headers = {'Content-Type': 'application/json'};

      var Url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.registerEmail);

      Map body = {
        'name ': fullName.text,
        'phone': phoneNumber.text,
        'email ': email.text.trim(),
        'gender ': gender.text,
        'city ': city.text,
        'birthDate': birthDate,
        'password ': password.text,
        //'confirmPassword ': confirmPassword.text,
      };
      http.Response response =
          await http.post(Url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);
          fullName.clear();
          phoneNumber.clear();
          email.clear();
          gender.clear();
          city.clear();
          password.clear();
          Get.toNamed(AppRoute.Phonevarification);
        }
      } else {
        throw jsonDecode(response.body)["masssage"] ?? "unknown Error occured";
      }

    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text("Errorrrrrr"),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
 */