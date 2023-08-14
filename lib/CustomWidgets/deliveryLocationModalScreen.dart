import 'package:flutter/material.dart';
import 'package:mothering_app/Screens/other%20Screens/addressbook.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ModalDeliveryLocation extends StatelessWidget {
  final String playAreaName;
  final String playAreaLocation;

  const ModalDeliveryLocation({
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
        width: 50,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color.fromRGBO(150, 150, 150, 1),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              builder: (BuildContext context) {
                return Container(
                  height: 350,
                  child: Column(
                    children: <Widget>[
                      // Choose your location Heading
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          right: 20,
                          left: 20,
                          bottom: 8,
                        ),
                        child: TextContainer_Location(),
                      ),
                      // Address Container
                      TextContainer_Address(
                        userName: 'Savan Mehta',
                        userAddress:
                            'Block no. 541, Sky Appartment, Near M.G Road, Opp. Motivihar Garden, Mumbai - 40002',
                      ),
                      // Add address container
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          right: 18,
                          left: 18,
                          bottom: 8,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromRGBO(196, 196, 196, 1),
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    pushNewScreen(
                                      context,
                                      screen: AddressbookScreen(),
                                      withNavBar:
                                          false, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                  },
                                  child: const Text(
                                    'Manage address book',
                                    style: TextStyle(
                                      color: Color.fromRGBO(54, 102, 149, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Icons
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('object');
                              },
                              child: Container(
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Color.fromRGBO(124, 219, 253, 1),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 8.0,
                                        left: 8,
                                        right: 16,
                                        bottom: 8,
                                      ),
                                      child: Text(
                                        'Enter a Pincode',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(124, 219, 253, 1),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 3,
                              color: Color.fromRGBO(124, 219, 253, 1),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Tapped now');
                              },
                              child: Container(
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.gps_fixed,
                                      color: Color.fromRGBO(124, 219, 253, 1),
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 8.0,
                                        left: 8,
                                        right: 16,
                                        bottom: 8,
                                      ),
                                      child: Text(
                                        'Use my current location',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(124, 219, 253, 1),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
        ),
      ),
    );
  }
}

class TextContainer_Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 5,
          color: const Color.fromRGBO(124, 218, 252, 1),
        ),
        const SizedBox(
          width: 5,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your Location',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Text(
              'Select a delivery location to see product availability and delivery option.',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TextContainer_Address extends StatelessWidget {
  final String userName;
  final String userAddress;

  TextContainer_Address({
    required this.userName,
    required this.userAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        right: 16,
        left: 16,
        bottom: 16,
      ),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(124, 218, 252, 1),
            width: 2.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                right: 8,
                left: 8,
                bottom: 6,
              ),
              child: Text(
                userName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                right: 8,
                left: 8,
                bottom: 8,
              ),
              child: Text(
                userAddress,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                overflow: TextOverflow
                    .ellipsis, // or TextOverflow.visible for no ellipsis
                maxLines: 2, // Adjust the number of lines as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
