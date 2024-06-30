import 'package:get/get.dart';

class RecieveController extends GetxController {
  var current = 0.obs;

  List<Map<String, dynamic>> dataList = [
    {'text': ' Mobile Number ', 'imageUrl': 'assets/images/send 1.png'},
    {'text': ' Payment Address ', 'imageUrl': 'assets/images/send 3.png'},
    {'text': ' Multiple Collect ', 'imageUrl': 'assets/images/Recieve 3.png'},
    {'text': ' Generate QR ', 'imageUrl': 'assets/images/Pocket.png'},
  ];

  void changeIndex(int index) {
    current.value = index;
  }
}
