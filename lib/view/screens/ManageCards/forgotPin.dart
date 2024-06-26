import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/view/screens/ManageCards/addCard.dart';
import 'package:gradp2p/view/screens/ManageCards/changePin/changePin.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class forgotPin extends StatefulWidget {
  const forgotPin({super.key});

  @override
  State<forgotPin> createState() => _forgotPinState();
}

class _forgotPinState extends State<forgotPin> {
  bool secureTextA = true;
  bool secureTextB = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Forgot pin'),
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
                        Row(
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
                        SizedBox(
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

                            prefixIcon: ImageIcon(
                              AssetImage('assets/images/Bank Card.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
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
                                    secureTextB = !secureTextB;
                                  });
                                },
                                icon: Icon(secureTextB
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                          ],
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 24),
                        child: PinCodeTextField(
                          obscureText: secureTextB,
                          obscuringCharacter: '*', // Custom obscuring character
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          appContext: context,
                          // controller: controller,
                          length: 4,
                          cursorHeight: 19,
                          enableActiveFill: true,
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                ],
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => setNewPin()));
                  },
                  child: Text("DONE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      )),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: Color(0xff5063bf),
                    //elevation: 10,
                    //  minimumSize: Size(100, 50)
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
