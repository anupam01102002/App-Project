import 'package:flutter/material.dart';
// import 'package:mothering_app/CustomWidgets/addressContainer.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/app_drawer/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/subtitle.dart';
import 'package:mothering_app/Screens/other%20Screens/addressbook.dart';
import 'package:mothering_app/models/address_create_model.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'dart:convert';
import 'package:mothering_app/models/Address_model.dart';

class NewAddress extends StatefulWidget {
  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedOption = 'Home';

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _Addresscontroller = TextEditingController();
  final TextEditingController _Address1controller = TextEditingController();
  final TextEditingController _Landmarkcontroller = TextEditingController();
  final TextEditingController _Pincodecontroller = TextEditingController();
  final TextEditingController _Citycontroller = TextEditingController();
  final TextEditingController _Statecontroller = TextEditingController();
  final TextEditingController _MobileNumbercontroller = TextEditingController();

  Future<void> postRequest(
    String Name,
    String Address,
    String Address1,
    String Landmark,
    String Pincode,
    String City,
    String State,
    String Mobile,
  ) async {
    var url =
        'http://msocial-ecommerce.shivinfotechsolution.in/api/v1/address/create';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "User-Agent": "PostmanRuntime/7.30.0",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization":
          "eyJpdiI6ImdtSHgxRUlrdXBUZ0RHSTRVZGdnUEE9PSIsInZhbHVlIjoicForQ0xRbzhzaG0vVlVPbHM5cTVETkdJSFBBNjEzQnNaaHAxV2JDUmpMR0w0WVgybnRlZ2lhTENwM0JGZWorQVF1WjU5dWNqUHFvRG9UcFk4ZThpSXc9PSIsIm1hYyI6ImNhOGIwZDJjOWIzYjI5MjRkYzY3YTMxOGEyYTQxMDU2YzY5YjFjY2FjNWUwNmE0NjU0OGExZjc5MmE5NDJkODQiLCJ0YWciOiIifQ"
    };

    try {
      // if (name.isEmpty ||
      //     mobileNumber.isEmpty ||
      //     emailAddress.isEmpty ||
      //     Password.isEmpty) {
      //   throw Exception('Please Fill all the Field');
      // } else if (mobileNumber.length != 10) {
      //   throw Exception('Please Enter a valid Phone Number');
      // }

      dio.FormData formData = dio.FormData.fromMap({
        "name": Name,
        "mobile": Mobile,
        "address": Address,
        "address1": Address1,
        "city": City,
        "state": State,
        "country": "India",
        "pincode": Pincode,
        "landmark": Landmark,
        "type": 1
      });
      var response = await dio.Dio().post(
        url,
        options: dio.Options(headers: headers),
        data: formData,
      );
      var jsonObject = jsonDecode(response.toString());
      print(jsonObject);

      if (response.statusCode == 201) {
        var registerResponse = AddressCreate.fromJson(jsonObject);

        if (registerResponse.status == 201) {
          var addresses = await getAddress();
          // Successful Address Creation
          Future.delayed(Duration.zero, () {
            pushNewScreen(
              context,
              screen: AddressbookScreen(
                addresses: addresses,
              ),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          });
          // print('error 5');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(registerResponse.message ?? ''),
            backgroundColor: Colors.redAccent,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to Add Address"),
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
    }
  }

  Widget radioContainer(String name) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 0,
          right: 20,
          top: 0,
          bottom: 0,
        ),
        child: Row(
          children: [
            Theme(
              data: ThemeData(
                unselectedWidgetColor: const Color.fromRGBO(196, 196, 196, 1),
              ),
              child: Radio(
                value: name,
                groupValue: _selectedOption,
                fillColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromRGBO(124, 219, 253, 1),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      resizeToAvoidBottomInset: true,
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Subtitle(
              containerHeight: 20,
              containerWidth: 10,
              enterText: 'Add New Address',
              textColor: Colors.black,
              containerColor: Color.fromRGBO(124, 218, 252, 1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 8.0, right: 12, left: 12, top: 4),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: _namecontroller,
                  cursorColor: Colors.blue, // Set cursor color to blue
                  style: const TextStyle(
                      fontSize: 12), // Set input font size to 14
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 124, 168, 1)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 8.0, right: 12, left: 12, top: 4),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: _Addresscontroller,
                  cursorColor: Colors.blue, // Set cursor color to blue
                  style: const TextStyle(
                      fontSize: 12), // Set input font size to 14
                  decoration: const InputDecoration(
                    labelText: 'Flat No. House/Building',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 124, 168, 1)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 0.0, right: 12, left: 12, top: 0),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: _Address1controller,
                  cursorColor: Colors.blue, // Set cursor color to blue
                  style: const TextStyle(
                      fontSize: 12), // Set input font size to 14
                  decoration: const InputDecoration(
                    labelText: 'Street Address/colony',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 124, 168, 1)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 0.0, right: 12, left: 12, top: 4),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: _Landmarkcontroller,
                  cursorColor: Colors.blue, // Set cursor color to blue
                  style: const TextStyle(
                      fontSize: 12), // Set input font size to 14
                  decoration: const InputDecoration(
                    labelText: 'Landmark',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 124, 168, 1)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 0, right: 12, left: 12, top: 4),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: _Pincodecontroller,
                  cursorColor: Colors.blue, // Set cursor color to blue
                  style: const TextStyle(
                      fontSize: 12), // Set input font size to 14
                  decoration: const InputDecoration(
                    labelText: 'Pincode',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 124, 168, 1)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 0.0, right: 12, left: 12, top: 4),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: _Citycontroller,
                  cursorColor: Colors.blue, // Set cursor color to blue
                  style: const TextStyle(
                      fontSize: 12), // Set input font size to 14
                  decoration: const InputDecoration(
                    labelText: 'City',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 124, 168, 1)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 0.0, right: 12, left: 12, top: 4),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: _Statecontroller,
                  cursorColor: Colors.blue, // Set cursor color to blue
                  style: const TextStyle(
                      fontSize: 12), // Set input font size to 12
                  decoration: const InputDecoration(
                    labelText: 'State',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 124, 168, 1)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 0.0, right: 12, left: 12, top: 4),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: _MobileNumbercontroller,
                  cursorColor: Colors.blue, // Set cursor color to blue
                  style: const TextStyle(
                      fontSize: 12), // Set input font size to 12
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 124, 168, 1)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Address Type: '),
                  radioContainer('Home'),
                  radioContainer('Office'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        onTapAddressCreate();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 124, 168, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapAddressCreate() {
    FocusManager.instance.primaryFocus?.unfocus();

    postRequest(
      _namecontroller.text,
      _Addresscontroller.text,
      _Address1controller.text,
      _Landmarkcontroller.text,
      _Pincodecontroller.text,
      _Citycontroller.text,
      _Statecontroller.text,
      _MobileNumbercontroller.text,
    );
    // Timer(const Duration(seconds: 3), () {

    // });
  }
}
