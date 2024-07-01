import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Buy extends StatefulWidget {
  const Buy({super.key});

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  String dropdownvalue = 'EGY';
  String dropdownvalue2 = 'Egyptian pound';
  Icon dropdownicon = Icon(
    Icons.currency_pound,
    color: Colors.white,
    size: 30,
  );
  final myController = TextEditingController();

  var items = [
    'EGY',
    'USD',
  ];
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Buy BTC",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Amount",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontStyle: FontStyle.normal),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      DropdownButton(
                        value: dropdownvalue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            if (newValue == 'EGY') {
                              dropdownvalue2 = 'Egyptian pound';
                              dropdownicon = Icon(
                                Icons.currency_pound,
                                color: Colors.white,
                                size: 30,
                              );
                            } else {
                              dropdownvalue2 = 'USA Dollar';
                              dropdownicon = Icon(
                                Icons.attach_money,
                                color: Colors.white,
                                size: 30,
                              );
                            }
                          });
                        },
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      child: Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              padding: EdgeInsets.all(12),
                              child: dropdownicon),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            children: [
                              Text(dropdownvalue2,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                width: 200,
                                child: TextField(
                                    controller: myController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(children: [
              Expanded(
                child: Divider(
                  height: 3,
                  color: Colors.blueGrey,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.amberAccent, shape: BoxShape.circle),
                  child: Icon(
                    Icons.currency_exchange,
                    color: Colors.white,
                    size: 20,
                  )),
              Expanded(
                child: Divider(
                  height: 3,
                  color: Colors.blueGrey,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
            ]),
            const Text(
              "Crypto Volume",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontStyle: FontStyle.normal),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Text("Refresh",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      child: Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.amberAccent),
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.currency_bitcoin,
                                color: Colors.white,
                                size: 30,
                              )),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            children: [
                              Text("Bitcoin",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(myController.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
