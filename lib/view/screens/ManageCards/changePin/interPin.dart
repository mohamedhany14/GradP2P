import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/view/screens/ManageCards/changePin/changePin.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class interPin extends StatefulWidget {
  const interPin({super.key});

  @override
  State<interPin> createState() => _interPinState();
}

class _interPinState extends State<interPin> {
  TextEditingController controller = TextEditingController();
  bool secureTextA = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change pin'),
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
                    // margin: EdgeInsets.symmetric(horizontal: 20),
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
                      textStyle: TextStyle(
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
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => setNewPin(),
                      ),
                    );
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
