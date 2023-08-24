import 'package:flutter/material.dart';

class GiftCheckBox extends StatefulWidget {
  @override
  _GiftCheckBoxState createState() => _GiftCheckBoxState();
}

class _GiftCheckBoxState extends State<GiftCheckBox> {
  bool isChecked = false;

  void _handleCheckboxChange(bool? newValue) {
    setState(() {
      isChecked = newValue ?? false;
    });
    if (isChecked) {
      _openModalScreen();
    }
  }

  void _openModalScreen() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 16),
                child: Text(
                  'Gift Wrap',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Colors.blue,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 16),
                child: Text(
                  'Your Personalized message will be sent with your gift.',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, bottom: 2),
                      child: Text(
                        'Recepient\'s Name (Max. 60 Characters)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.only(
                        right: 16.0,
                        left: 16,
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(240, 240, 240, 1),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: TextField(
                          controller: null,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12.0,
                          ),
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, bottom: 2),
                      child: Text(
                        'Sender\'s Name (Max. 60 Characters)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.only(
                        right: 16.0,
                        left: 16,
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(240, 240, 240, 1),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: TextField(
                          controller: null,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12.0,
                          ),
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, bottom: 2),
                      child: Text(
                        'Message (Max. 150 Characters)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.only(
                        right: 16.0,
                        left: 16,
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(240, 240, 240, 1),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                        child: TextField(
                          controller: null,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12.0,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                'Gift for your birthday, happy Birthday To you, God Bless You.',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(54, 102, 149, 1),
                              fontSize: 12,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 40.0,
                            ),
                            primary: Color.fromRGBO(196, 196, 196, 1),
                          ),
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 40.0,
                            ),
                            primary: const Color.fromRGBO(54, 102, 149, 1),
                          ),
                          child: const Text(
                            'SAVE',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes the position of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: const Row(
                  children: [
                    Icon(Icons.wallet_giftcard_sharp),
                    SizedBox(width: 4),
                    Text(
                      'Add Gift Wrap @ Rs. 30',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: isChecked,
                onChanged: _handleCheckboxChange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
