import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "phonenumber") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid Phone number";
    }
  }
  if (type == "userName") {
    if (!GetUtils.isUsername(val)) {
      return "not valid user name";
    }
  }
  // if (type == "userName") {
  //   if (val != String) {
  //     return "not valid name";
  //   }
  // }
  if (type == "amount") {
    if (!GetUtils.isNum(val)) {
      return "not valid amount";
    }
  }
  if (type == "amount") {
    if (val == 0) {
      return " amount cant be zero";
    }
  }
  if (val.length < min) {
    return "Value cant less than min ";
  }
  if (val.length > max) {
    return "Value cant more than max ";
  }
  if (val.isEmpty) {
    return "Value cant be empty";
  }
}
