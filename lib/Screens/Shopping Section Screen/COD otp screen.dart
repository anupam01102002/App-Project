import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CODOTPVerificationScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      width: 48,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(0, 0, 0, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: BorderDirectional(
            bottom: BorderSide(width: 2, color: Color.fromRGBO(41, 195, 250, 1),)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.17),
            Image.asset(
              'assets/images/Mothering_logo_blue.png',
              width: 80.0,
              height: 80.0,
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.06),
            const Text(
              'Almost Done!',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(41, 195, 250, 1),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Just verify with an OTP sent to 99899 99899',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(41, 195, 250, 1),
              ),
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.04),
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.05),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
                primary: const Color.fromRGBO(0, 176, 240, 1),
              ),
              child: const Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Add your logic here
              },
              style: TextButton.styleFrom(
                primary: Color.fromRGBO(41, 195, 250, 1),
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text(
                'RESEND OTP',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
