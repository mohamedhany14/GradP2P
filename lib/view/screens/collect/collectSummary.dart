import 'package:flutter/material.dart';
import 'package:gradp2p/core/constants/colors.dart';

class Collectsummary extends StatelessWidget {
  const Collectsummary({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.1 / 3,
                  ),
                  Text(
                    'Payment Succes!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.07,
                    ),
                  ),
                  Text(
                    'Your payment has been successfully done.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.07,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.3 / 3,
                  ),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: schafoldGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name:"),
                              Text(
                                "Mohamed Hany Elsayed Mohsen",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Governorate:"),
                              Text(
                                "Ismailia",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("counter number:"),
                              Text(
                                "1234567",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Electricity provider:"),
                              Text(
                                "TAQA Gas Company",
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Bill:"),
                              Text(
                                "---------",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Date:"),
                              Text(
                                "march",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Invoince number:"),
                              Text(
                                "224055",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Invoince value :",
                                style: TextStyle(fontSize: 20),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "150",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "LE",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("confirm",
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
                    minimumSize: Size(200, 60)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
