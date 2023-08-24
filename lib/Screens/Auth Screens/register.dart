import 'package:flutter/material.dart';
import 'package:mothering_app/Screens/Auth%20Screens/login_page.dart';
import 'package:mothering_app/models/register_model.dart';
import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'dart:convert';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  Future<void> postRequest(
    String name,
    String mobileNumber,
    String emailAddress,
    String Password,
  ) async {
    var url =
        'http://msocial-ecommerce.shivinfotechsolution.in/api/v1/register';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "User-Agent": "PostmanRuntime/7.30.0",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive"
    };

    try {
      if (name.isEmpty ||
          mobileNumber.isEmpty ||
          emailAddress.isEmpty ||
          Password.isEmpty) {
        throw Exception('Please Fill all the Field');
      } else if (mobileNumber.length != 10) {
        throw Exception('Please Enter a valid Phone Number');
      }

      dio.FormData formData = dio.FormData.fromMap({
        'name': name,
        'email': emailAddress,
        'mobile': mobileNumber,
        'password': Password,
        "device": 1,
        "loginType": 2,
        "fcmToken": ""
      });
      var response = await dio.Dio().post(
        url,
        // options: dio.Options(headers: headers),
        data: formData,
      );
      var jsonObject = jsonDecode(response.toString());

      if (response.statusCode == 201) {
        var registerResponse = RegisterModel.fromJson(jsonObject);

        if (registerResponse.status == 201) {
          // Successful Registeration
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
          print('error 5');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(registerResponse.message ?? ''),
            backgroundColor: Colors.redAccent,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to Register"),
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
        _btnController.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(124, 218, 252, 1),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width * 0.1),
                  height: (MediaQuery.of(context).size.width * 0.09),
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                  ),
                ),
              ],
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.04),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: const Text(
                          'Full Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Color.fromRGBO(0, 124, 168, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.008),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300, // Adjust the width as needed
                      height: 30, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Full name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: const Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Color.fromRGBO(0, 124, 168, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.008),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300, // Adjust the width as needed
                      height: 30, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: mobilenumberController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Mobile Number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: const Text(
                          'Email ID',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Color.fromRGBO(0, 124, 168, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.008),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300, // Adjust the width as needed
                      height: 30, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Email ID',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: const Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Color.fromRGBO(0, 124, 168, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.008),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300, // Adjust the width as needed
                      height: 30, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                onPressed: onTapRegister,
                child: const Text(
                  'CONTINUE',
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
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    'Kindly fill & submit the below information to create your Mothering account with your phone number',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color.fromRGBO(0, 124, 168, 1),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapRegister() {
    FocusManager.instance.primaryFocus?.unfocus();

    postRequest(
      nameController.text,
      mobilenumberController.text,
      emailController.text,
      passwordController.text,
    );
    Timer(const Duration(seconds: 3), () {
      _btnController.reset();
    });
  }
}
