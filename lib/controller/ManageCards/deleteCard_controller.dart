import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class DeletecardController extends GetxController {
  DeleteCard();
}

class DeletecardControllerImp extends DeletecardController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> DeleteCard() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final token = prefs.getString('token');
      final defaultCardId = prefs.getString('defaultCardId');

      if (token == null) {
        Get.snackbar("Error", "Token not found. Please login again.");
        return;
      }

      if (defaultCardId == null) {
        Get.snackbar("Error", "Default card ID not found.");
        return;
      }

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var request = http.Request(
          'DELETE',
          Uri.parse(
              'https://smart-pay.onrender.com/api/v0/users/cards/$defaultCardId'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Get.snackbar("Success", "Card deleted successfully.");
      } else {
        print(response.reasonPhrase);
        Get.snackbar(
            "Error", "Failed to delete card: ${response.reasonPhrase}");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
