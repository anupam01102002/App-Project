import 'package:flutter/material.dart';
import 'package:mothering_app/Screens/Auth%20Screens/register.dart';
import 'dart:async';
import 'package:mothering_app/models/log_in_model.dart';
import './otp.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:convert';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobilenumberController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  Future<void> postRequest(String mobileNumber) async {
    var url = 'http://msocial-ecommerce.shivinfotechsolution.in/api/v1/login';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "User-Agent": "PostmanRuntime/7.30.0",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive"
    };

    try {
      if (mobileNumber.isEmpty) {
        throw Exception('Mobile can\'t be empty');
      } else if (mobileNumber.length != 10) {
        throw Exception('Please enter a valid mobile number');
      }

      dio.FormData formData = dio.FormData.fromMap({
        'mobile': mobileNumber,
      });

      var response = await dio.Dio().post(
        url,
        options: dio.Options(
          headers: headers,
        ),
        data: formData,
      );

      var jsonObject = jsonDecode(response.toString());

      if (response.statusCode == 200) {
        var loginResponse = LogInModel.fromJson(jsonObject);
        print(response);

        if (loginResponse.status == 200) {
          print(response);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OtpScreen(mobileNumber: mobileNumber),
          ));
        } else {
          print(response);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(loginResponse.message ?? ''),
            backgroundColor: Colors.redAccent,
          ));
        }
      } else {
        print(response);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sending Message"),
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
          margin: const EdgeInsets.only(top: 8.0),
        ),
      );
      setState(() {
        _btnController.error();
      });
    } finally {
      Timer(const Duration(seconds: 3), () {
        mobilenumberController.clear();
        _btnController.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(124, 218, 252, 1),
      body: Column(
        children: [
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.2),
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
            'LOGIN',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: TextField(
                controller: mobilenumberController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Mobile Number',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.all(16.0),
                ),
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.03),
          Container(
            height: 35,
            width: 150,
            child: RoundedLoadingButton(
              controller: _btnController,
              onPressed: onTapSendotp,
              child: const Text(
                'Send OTP',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.01),
          Image.asset(
            'assets/images/OR_dashed_line.png',
            width: 500,
            height: 50.0,
          ),
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.01),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              primary: Colors.white,
            ),
            icon: Image.asset(
              'assets/images/Google_logo.png',
              width: 24.0,
              height: 24.0,
            ),
            label: const Text(
              'Continue with Google',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'New User?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ));
                },
                child: const Text('Register Here'),
              )
            ],
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
    );
  }

  onTapSendotp() {
    FocusManager.instance.primaryFocus?.unfocus();

    postRequest(
      mobilenumberController.text,
    );
    Timer(const Duration(seconds: 3), () {
      mobilenumberController.clear();
      _btnController.reset();
    });
  }
}
