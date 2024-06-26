import 'package:flutter/material.dart';

class CreditCardContainer extends StatelessWidget {
  const CreditCardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 340,
        height: 80,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF5163BF)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/Mastercard-logo.svg.png")),
            // SizedBox(
            //   width: 10,
            // ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(height: 10,),
                Text(
                  'EXAMPLE@SMARTPAY',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 12,
                    fontFamily: 'Actor',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.04,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BANK NAME',
                      style: TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 12,
                        fontFamily: 'Actor',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.04,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '6253',
                      style: TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 13,
                        fontFamily: 'Abel',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),

            GestureDetector(
              onTap: () {},
              child: Container(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Check',
                      style: TextStyle(
                        color: Color(0xFF5163BF),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.05,
                      ),
                    ),
                    Text(
                      'Balance',
                      style: TextStyle(
                        color: Color(0xFF5163BF),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.05,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
