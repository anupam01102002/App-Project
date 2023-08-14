import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/subtitle.dart';

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
      resizeToAvoidBottomInset: false,
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
                        print("NEXT button pressed!");
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
                        print("NEXT button pressed!");
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
}
