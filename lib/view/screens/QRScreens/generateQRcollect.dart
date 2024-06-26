import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/view/screens/QRScreens/generateCodeQR.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveMoneyScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Receiver Email'),
          ),
          SizedBox(height: 20),
          TextField(
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String email = emailController.text;
              String amount = amountController.text;
              if (email.isNotEmpty && amount.isNotEmpty) {
                 List<String> qrData = [email, amount];
                Get.to(() => GenerateQRScreen(qrData: qrData));
              } else {
                Get.snackbar('Error', 'Please fill in all fields');
              }
            },
            child: Text('Generate QR Code'),
          ),
        ],
      ),
    );
  }
}
