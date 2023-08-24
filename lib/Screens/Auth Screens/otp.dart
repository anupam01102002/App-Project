import 'package:flutter/material.dart';
// import 'package:mothering_app/Screens/NavBarScreens/home.dart';
import 'package:mothering_app/home_screen.dart';
import 'package:mothering_app/models/cart_count.dart';
import 'package:pinput/pinput.dart';
import 'package:mothering_app/models/otp_model.dart';
import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'dart:convert';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class OtpScreen extends StatefulWidget {
  final String mobileNumber;

  OtpScreen({
    required this.mobileNumber,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState(
        mobileNumber: mobileNumber,
      );
}

class _OtpScreenState extends State<OtpScreen> {
  final String? mobileNumber;

  _OtpScreenState({
    required this.mobileNumber,
  });

  TextEditingController otpController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  Future<void> postRequest(String otp, String? mobileNumber) async {
    var url =
        'http://msocial-ecommerce.shivinfotechsolution.in/api/v1/otp-check';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "User-Agent": "PostmanRuntime/7.30.0",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive"
    };

    try {
      if (otp.isEmpty || otp.length < 4) {
        throw Exception('otp can\'t be empty');
      }

      dio.FormData formData = dio.FormData.fromMap({
        'otp': otp,
        "mobile": mobileNumber,
      });

      var response = await dio.Dio().post(
        url,
        options: dio.Options(headers: headers),
        data: formData,
      );

      var jsonObject = jsonDecode(response.toString());

      if (response.statusCode == 200) {
        var otpVerificationResponse = OTPModel.fromJson(jsonObject);

        if (otpVerificationResponse.status == 200) {
          // Successful otp verification
          int count = await getCount();
          // String? token = otpVerificationResponse.data?.token;
          // User? userData = otpVerificationResponse.data?.user;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeScreen(count: count),
            ),
          );
          // Now you can proceed with using the token and user data
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(otpVerificationResponse.message ?? ''),
            backgroundColor: Colors.redAccent,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to verify otp"),
          ),
        );
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 8.0),
        ),
      );
      setState(() {
        _btnController.error();
      });
    } finally {
      Timer(Duration(seconds: 3), () {
        otpController.clear();
        _btnController.reset();
      });
    }
  }

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
            bottom: BorderSide(width: 2, color: Colors.white)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(124, 218, 252, 1),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.17),
            Image.asset(
              'assets/images/Mothering_logo.png',
              width: 80.0,
              height: 80.0,
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.06),
            const Text(
              'Enter otp',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
              controller: otpController,
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.05),
            Container(
              height: 35,
              width: 150,
              child: RoundedLoadingButton(
                controller: _btnController,
                onPressed: onTapVerifyotp,
                child: const Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Add your logic here
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text(
                'Resend OTP',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Image.asset(
                    'assets/images/Mothering_Text.png',
                    width: 200.0,
                    height: 100.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapVerifyotp() {
    FocusManager.instance.primaryFocus?.unfocus();

    postRequest(
      otpController.text,
      mobileNumber,
    );
    Timer(Duration(seconds: 3), () {
      otpController.clear();
      _btnController.reset();
    });
  }
}
