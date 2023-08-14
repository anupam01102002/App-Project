import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/pincodecontainer.dart';
import 'package:mothering_app/Screens/NavBarScreens/playArea.dart';

class PlayAreaDetailsScreen extends StatelessWidget {
  final String playAreaName;
  final String playAreaLocation;
  final String playAreaDetails;
  final String emailId;
  final int phoneNumber;
  final List<String> criteraItems;

  const PlayAreaDetailsScreen({
    required this.playAreaDetails,
    required this.playAreaName,
    required this.playAreaLocation,
    required this.phoneNumber,
    required this.emailId,
    required this.criteraItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 215, 192, 1),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(243, 149, 96, 1),
                Color.fromRGBO(251, 170, 124, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const PincodeContainer(pincode: 365420),
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              right: 8,
              left: 8,
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(243, 149, 97, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.27 * 0.17,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Color.fromRGBO(204, 88, 24, 1),
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              playAreaLocation,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(204, 88, 24, 1),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          left: 16,
                          bottom: 8,
                        ),
                        child: Text(
                          playAreaName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 16,
                          right: 16,
                          bottom: 8,
                        ),
                        child: Text(
                          playAreaDetails,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Container(
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              0.20,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                AdvertisementContainer(
                                  imageUrl: 'assets/images/Add_1.png',
                                ),
                                AdvertisementContainer(
                                  imageUrl: 'assets/images/Add_1.png',
                                ),
                                AdvertisementContainer(
                                  imageUrl: 'assets/images/Add_1.png',
                                ),
                                AdvertisementContainer(
                                  imageUrl: 'assets/images/Add_1.png',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          left: 16,
                          bottom: 8,
                        ),
                        child: Text(
                          'Student Evaluation Criteria: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          height: 150,
                          child: ListView.builder(
                            itemCount: criteraItems.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 30,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      criteraItems[index],
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                      left: 8,
                                      right: 16,
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      '+91 $phoneNumber',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                      left: 8,
                                      right: 16,
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      emailId,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ModalBookYourSlot(
            playAreaName: playAreaName,
            playAreaLocation: playAreaLocation,
          ),
        ],
      ),
    );
  }
}

class ModalBookYourSlot extends StatelessWidget {
  final String playAreaName;
  final String playAreaLocation;

  const ModalBookYourSlot({
    required this.playAreaName,
    required this.playAreaLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              builder: (BuildContext context) {
                return Container(
                  height: 350,
                  child: Column(
                    children: <Widget>[
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 24.0, bottom: 16),
                            child: Text(
                              'BOOK YOUR SLOT',
                              style: TextStyle(
                                color: Color.fromRGBO(243, 149, 97, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.only(
                              right: 16.0,
                              left: 16,
                              top: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(240, 240, 240, 1),
                              border: Border.all(
                                color: Colors.orange,
                                width: 2.0,
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
                                  hintText: 'Date',
                                  hintStyle: TextStyle(color: Colors.orange),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 4.0),
                                        child: Text(
                                          'Start Time',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 149, 97, 1),
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 35,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        padding: const EdgeInsets.only(
                                          right: 16.0,
                                          left: 16,
                                          top: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              240, 240, 240, 1),
                                          border: Border.all(
                                            color: Colors.orange,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: const Center(
                                          child: TextField(
                                            controller: null,
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 12.0,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Date',
                                              hintStyle: TextStyle(
                                                color: Colors.orange,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 4.0),
                                        child: Text(
                                          'End Time',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(243, 149, 97, 1),
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 35,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        padding: const EdgeInsets.only(
                                          right: 16.0,
                                          left: 16,
                                          top: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              240, 240, 240, 1),
                                          border: Border.all(
                                            color: Colors.orange,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: const Center(
                                          child: TextField(
                                            controller: null,
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 12.0,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Date',
                                              hintStyle: TextStyle(
                                                color: Colors.orange,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Hour',
                                  style: TextStyle(
                                    color: Color.fromRGBO(243, 149, 97, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '1 hour 0 min',
                                  style: TextStyle(
                                    color: Color.fromRGBO(243, 149, 97, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
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
                                primary: const Color.fromRGBO(243, 149, 97, 1),
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  playAreaName,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(243, 149, 97, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  color: Color.fromRGBO(204, 88, 24, 1),
                                  size: 16,
                                ),
                                Text(
                                  playAreaLocation,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(204, 88, 24, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Text(
            'BOOK YOUR SLOT',
            style: TextStyle(
              color: Color.fromRGBO(243, 149, 97, 1),
            ),
          ),
        ),
      ),
    );
  }
}
