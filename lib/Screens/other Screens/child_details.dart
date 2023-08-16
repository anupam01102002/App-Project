import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
// import 'package:mothering_app/Screens/NavBarScreens/home.dart';
import 'package:mothering_app/home_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';

class ChildDetails extends StatefulWidget {
  @override
  State<ChildDetails> createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {
  bool status = false;
  final TextEditingController _dobcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  int monthsPassed = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dobcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your child details to have',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4.0),
              const Text(
                'personalized shopping and parenting ',
              ),
              const SizedBox(height: 4.0),
              const Text(
                'experience.',
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BOY',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 176, 240, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: FlutterSwitch(
                      width: 65.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 15.0,
                      value: status,
                      borderRadius: 30.0,
                      padding: 4.0,
                      showOnOff: false,
                      toggleColor: Colors.white,
                      switchBorder: Border.all(
                          color: const Color.fromRGBO(0, 176, 240, 1),
                          width: 2),
                      toggleBorder: Border.all(
                          color: const Color.fromRGBO(0, 176, 240, 1),
                          width: 3),
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'GIRL',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 176, 240, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300, // Adjust the width as needed
                    height: 40, // Adjust the height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.blue),
                      color: Colors.white,
                    ),
                    child: TextField(
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          _dobcontroller.text =
                              DateFormat('MM/dd/yyyy').format(date);
                        }
                      },
                      controller: _dobcontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Date of Birth',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(150, 150, 150, 1),
                          fontSize: 16,
                        ),
                        contentPadding: EdgeInsets.all(12.0),
                      ),
                      keyboardType: TextInputType.datetime,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300, // Adjust the width as needed
                    height: 40, // Adjust the height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.blue),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _namecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Child Name',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(150, 150, 150, 1),
                          fontSize: 16,
                        ),
                        contentPadding: EdgeInsets.all(12.0),
                      ),
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35.0),
              ElevatedButton(
                onPressed: () {
                  // print(_dobcontroller.text);
                  // print(DateFormat("dd/MM/yyyy").parse(_dobcontroller.text));
                  // print(calculateMonthsPassed(
                  //     DateFormat("dd/MM/yyyy").parse(_dobcontroller.text)));
                  // calculateMonthsPassed(DateTime.parse(_dobcontroller.text));
                  pushNewScreen(
                    context,
                    screen: HomeScreen(
                      name: _namecontroller.text.toString(),
                      dob: _dobcontroller.text.toString(),
                      show: true,
                      months: calculateMonthsPassed(
                          DateFormat("dd/MM/yyyy").parse(_dobcontroller.text)),
                    ),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 40.0),
                  primary: const Color.fromRGBO(0, 176, 240, 1),
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Period calculateMonthsPassed(DateTime fromMonth) {
    LocalDateTime a = LocalDateTime.now();
    LocalDateTime b = LocalDateTime.dateTime(fromMonth);
    Period diff = a.periodSince(b);
    return (diff);
  }
}
