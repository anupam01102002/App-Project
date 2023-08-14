import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/subtitle.dart';
import 'package:intl/intl.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _expectingdatecontroller =
      TextEditingController();

  String _selectedOption = 'MOM';
  String _selectedExpectingOption = 'EXPECTING MOTHER';
  File? _image;
  bool _showDateInput = false;
  bool _showExpectingInput = false;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  getImage(ImageSource.camera);
                },
              ),
              const Text('Open Camera'),
              IconButton(
                icon: const Icon(Icons.image),
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
              ),
              const Text('Upload from gallery'),
            ],
          ),
        ],
      ),
    );
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
                    _showDateInput =
                        _selectedOption == "I AM EXPECTING ANOTHER CHILD";
                    _showExpectingInput = _selectedOption == "EXPECTING";
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

  Widget dateInputContainer() {
    return _showDateInput
        ? Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      width: 320,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        boxShadow: const [
                          BoxShadow(
                            color:
                                Color.fromRGBO(41, 195, 250, 1), // Blue color
                            offset: Offset(0, 0), // Adjust the offset as needed
                            blurRadius: 4, // Adjust the blur radius as needed
                          ),
                        ],
                      ),
                      child: TextField(
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          if (date != null) {
                            _expectingdatecontroller.text =
                                DateFormat('MM/dd/yyyy').format(date);
                          }
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Due Date',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        keyboardType: TextInputType.datetime,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => OtpScreen()),
                  // );
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
                  'SAVE',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox();
  }

  Widget ExpectingDetailsInputContainer() {
    return _showExpectingInput
        ? Column(
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('I am an...'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 30,
                      child: Row(
                        children: [
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor:
                                  const Color.fromRGBO(196, 196, 196, 1),
                            ),
                            child: Radio(
                              value: "EXPECTING MOTHER",
                              groupValue: _selectedExpectingOption,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(124, 219, 253, 1)),
                              onChanged: (value) {
                                setState(() {
                                  _selectedExpectingOption = value!;
                                  _showExpectingInput =
                                      _selectedExpectingOption ==
                                          "EXPECTING MOTHER";
                                });
                              },
                            ),
                          ),
                          const Text(
                            "EXPECTING MOTHER",
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 30,
                      child: Row(
                        children: [
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor:
                                  const Color.fromRGBO(196, 196, 196, 1),
                            ),
                            child: Radio(
                              value: "EXPECTING FATHER",
                              groupValue: _selectedExpectingOption,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(124, 219, 253, 1)),
                              onChanged: (value) {
                                setState(() {
                                  _selectedExpectingOption = value!;
                                  _showExpectingInput =
                                      _selectedExpectingOption ==
                                          "EXPECTING FATHER";
                                });
                              },
                            ),
                          ),
                          const Text(
                            "EXPECTING FATHER",
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  width: 320,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(41, 195, 250, 1), // Blue color
                        offset: Offset(0, 0), // Adjust the offset as needed
                        blurRadius: 4, // Adjust the blur radius as needed
                      ),
                    ],
                  ),
                  child: TextField(
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        _expectingdatecontroller.text =
                            DateFormat('MM/dd/yyyy').format(date);
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Due Date',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                    keyboardType: TextInputType.datetime,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => OtpScreen()),
                  // );
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
                  'SAVE',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(227, 248, 255, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Subtitle(
                containerHeight: 25,
                containerWidth: 15,
                enterText: 'My Profile',
                textColor: Color.fromRGBO(124, 219, 253, 1),
                containerColor: Color.fromRGBO(124, 219, 253, 1),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.04,
              ),
              Stack(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(177, 177, 177, 1),
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _image != null
                            ? Image.file(
                                _image!,
                                width: 250,
                                height: 250,
                                fit: BoxFit.cover,
                              ) as ImageProvider<Object>
                            : const AssetImage(
                                'assets/images/Profile_image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: const Color.fromRGBO(177, 177, 177, 1),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 20,
                        ),
                        color: Colors.black,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: const Text(
                            'Enter Your Name',
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
                        0.008,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 320,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          boxShadow: const [
                            BoxShadow(
                              color:
                                  Color.fromRGBO(41, 195, 250, 1), // Blue color
                              offset:
                                  Offset(0, 0), // Adjust the offset as needed
                              blurRadius: 4, // Adjust the blur radius as needed
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _namecontroller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Savan Mehta',
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
                    0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        radioContainer('MOM'),
                        radioContainer('DAD'),
                      ],
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.001,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          child: Row(
                            children: [
                              Theme(
                                data: ThemeData(
                                  unselectedWidgetColor:
                                      const Color.fromRGBO(196, 196, 196, 1),
                                ),
                                child: Radio(
                                  value: "I AM EXPECTING ANOTHER CHILD",
                                  groupValue: _selectedOption,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => const Color.fromRGBO(
                                          124, 219, 253, 1)),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedOption = value!;
                                      _showDateInput = _selectedOption ==
                                          "I AM EXPECTING ANOTHER CHILD";
                                    });
                                  },
                                ),
                              ),
                              const Text(
                                "I AM EXPECTING ANOTHER CHILD",
                                style: TextStyle(fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.001,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        radioContainer('GUARDIAN'),
                        radioContainer('EXPECTING'),
                      ],
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        radioContainer('TRYING TO CONCEIVE'),
                      ],
                    ),
                  ],
                ),
              ),
              dateInputContainer(),
              ExpectingDetailsInputContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
