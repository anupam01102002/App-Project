import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_2.dart';
import 'package:mothering_app/CustomWidgets/custombutton.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/pincodecontainer.dart';
import 'package:mothering_app/Screens/other%20Screens/playareadetailsscreen.dart';

class MotheringPlayAreaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(243, 252, 255, 1),
      appBar: motheringAppBar_2(),
      drawer: MotheringAppBarDrawer(),
      body: Center(
        child: Column(
          children: [
            // Delivery pincode Container
            PincodeContainer(pincode: 365420),
            //scrollable Row
            Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.20,
              color: Color.fromRGBO(206, 217, 255, 1),
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
            Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.63,
              width: double.infinity,
              color: Color.fromRGBO(243, 149, 97, 1),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          color: Color.fromRGBO(255, 215, 192, 1),
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.53,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Book Your Favourite Play Area',
                                style: TextStyle(
                                  color: Color.fromRGBO(115, 56, 2, 1),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomButton(
                                width: MediaQuery.of(context).size.width * 0.7,
                                buttonName: 'Nunit Play Area',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PlayAreaDetailsScreen(
                                        playAreaLocation: 'New Delhi',
                                        playAreaDetails:
                                            'There are many different styles of playhouse plans below, all the way from the traditional playhouse to playhouses that are more like forts.',
                                        playAreaName: 'Nunit Play Area',
                                        phoneNumber: 7717777177,
                                        emailId: 'Google123@Gmail.com',
                                        criteraItems: [
                                          'Language Enhancement',
                                          'Creativity',
                                          'Fine Motor Skills',
                                          'General Knowledge',
                                          'overall Development',
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                fillColor: Color.fromRGBO(255, 255, 255, 1),
                                textColor: Color.fromRGBO(211, 101, 0, 1),
                                borderColor: Color.fromRGBO(251, 170, 124, 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomButton(
                                width: MediaQuery.of(context).size.width * 0.7,
                                buttonName: 'Kids and Kingdom',
                                onPressed: () {},
                                fillColor: Color.fromRGBO(255, 255, 255, 1),
                                textColor: Color.fromRGBO(211, 101, 0, 1),
                                borderColor: Color.fromRGBO(251, 170, 124, 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomButton(
                                width: MediaQuery.of(context).size.width * 0.7,
                                buttonName: 'Podar Kids Zone',
                                onPressed: () {},
                                fillColor: Color.fromRGBO(255, 255, 255, 1),
                                textColor: Color.fromRGBO(211, 101, 0, 1),
                                borderColor: Color.fromRGBO(251, 170, 124, 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomButton(
                                width: MediaQuery.of(context).size.width * 0.7,
                                buttonName: 'Babyland Junior Play Area',
                                onPressed: () {},
                                fillColor: Color.fromRGBO(255, 255, 255, 1),
                                textColor: Color.fromRGBO(211, 101, 0, 1),
                                borderColor: Color.fromRGBO(251, 170, 124, 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomButton(
                                width: MediaQuery.of(context).size.width * 0.7,
                                buttonName: 'Kids & Kingdom',
                                onPressed: () {},
                                fillColor: Color.fromRGBO(255, 255, 255, 1),
                                textColor: Color.fromRGBO(211, 101, 0, 1),
                                borderColor: Color.fromRGBO(251, 170, 124, 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomButton(
                                width: MediaQuery.of(context).size.width * 0.7,
                                buttonName: 'Podar Kids Zone',
                                onPressed: () {},
                                fillColor: Color.fromRGBO(255, 255, 255, 1),
                                textColor: Color.fromRGBO(211, 101, 0, 1),
                                borderColor: Color.fromRGBO(251, 170, 124, 1),
                              ),
                            ),
                          ],
                        ),
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

class AdvertisementContainer extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;

  AdvertisementContainer({required this.imageUrl, this.borderRadius = 20.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
