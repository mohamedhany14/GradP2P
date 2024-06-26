// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class GenerateQRScreen extends StatelessWidget {
//   final String qrData;

//   const GenerateQRScreen({Key? key, required this.qrData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('QR Code')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//            QrImageView( data: qrData,
//               version: QrVersions.auto,
//               size: 200.0,),
           
//             SizedBox(height: 20),
//             Text(
//               'Scan this QR Code to receive money',
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRScreen extends StatelessWidget {
  final List<String> qrData;

  const GenerateQRScreen({Key? key, required this.qrData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dataString = qrData.join('|'); // Combine list into a single string
    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: dataString,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

