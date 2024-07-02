import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  var dropdownValue = 'EGY'.obs;

  Widget dropDownIcon = Icon(
    Icons.currency_pound,
    color: Colors.white,
    size: 30,
  ).obs.value;
  Widget dropDownIcon2 = Icon(
    Icons.currency_pound,
    color: Colors.black,
    size: 20,
  ).obs.value;

  var items = [
    'EGY',
    'USD',
  ];

  void updateDropdownValue(String newValue) {
    dropdownValue.value = newValue;
    if (newValue == 'EGY') {
      dropDownIcon = Icon(
        Icons.currency_pound,
        color: Colors.white,
        size: 30,
      );
      dropDownIcon2 = Icon(
        Icons.currency_pound,
        color: Colors.black,
        size: 20,
      );
    } else {
      dropDownIcon = Icon(
        Icons.attach_money,
        color: Colors.white,
        size: 36,
      );
      dropDownIcon2 = Icon(
        Icons.attach_money,
        color: Colors.black,
        size: 20,
      );
    }
    update();
  }
}
