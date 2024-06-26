import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/view/screens/ManageCards/addCard.dart';
import 'package:gradp2p/view/screens/test.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class deleteCard extends StatefulWidget {
  const deleteCard({super.key});

  @override
  State<deleteCard> createState() => _deleteCardState();
}

class _deleteCardState extends State<deleteCard> {
  @override
  TextEditingController controller = TextEditingController();
  bool secureTextA = true;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Delete card'),
          centerTitle: true, // Center the title horizontally
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 32,
              color: Colors.black54,
            ), // Leading arrow icon
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' Enter card number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.07,
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CardNumberInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: kColor1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // border: ,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),

                            labelText: "Card number",

                            prefixIcon: const ImageIcon(
                              AssetImage('assets/images/Bank Card.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          ' Enter card pin ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                secureTextA = !secureTextA;
                              });
                            },
                            icon: Icon(secureTextA
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ],
                    ),
                  ),
                  Container(
                    //  margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: PinCodeTextField(
                      obscureText: secureTextA,
                      obscuringCharacter: '*', // Custom obscuring character
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      appContext: context,
                      controller: controller,
                      length: 6,
                      cursorHeight: 19,
                      enableActiveFill: true,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldWidth: 50,
                        inactiveColor: Colors.grey,
                        selectedColor: kColor1,
                        activeFillColor: kColor1,
                        selectedFillColor: kColor1,
                        inactiveFillColor: Colors.grey,
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Test()));
                            },
                            child: const Text("Confirm"),
                          ),
                        ],
                        title: const Text("Warning"),
                        contentPadding: const EdgeInsets.all(20),
                        content: const Text(
                            "Are you sure you want to delete the card"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: const Color(0xff5063bf),
                  ),
                  child: const Text(
                    "DONE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
