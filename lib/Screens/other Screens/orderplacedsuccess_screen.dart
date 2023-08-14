import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/addressContainer.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/orederstatusdetails_screencontainer.dart';
import 'package:mothering_app/Screens/other%20Screens/cancel_order_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class OrderPlacedSuccessScreen extends StatelessWidget {
  final double price;

  OrderPlacedSuccessScreen({
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderPlacedSuccessfullyContainer(
              price: 45664.25,
              onTap: () {
                pushNewScreen(
                  context,
                  screen: OrderCancelScreen(
                    price: 213,
                  ),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
            AddressContainer(
              tagName: '',
              userName: 'userName',
              blockNo: 'blockNo',
              pincode: 123124,
              cityName: 'cityName',
              landmarkName: 'landmarkName',
              streetAddress: 'streetAddress',
              phoneNumber: 1234124423,
            ),
            Container(
              height: 3,
              width: double.infinity,
              color: const Color.fromRGBO(124, 218, 252, 1),
            ),
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/Banner_2.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              child: Image.asset('assets/images/Banner_1.png'),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/Banner_2.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              child: Image.asset('assets/images/Banner_1.png'),
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderPlacedSuccessfullyContainer extends StatelessWidget {
  final double price;
  VoidCallback onTap;

  OrderPlacedSuccessfullyContainer({
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 0), // controls the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('assets/images/Placed Order.png'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Placed Successfully',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Total Price:   Rs. ' + '$price',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: const Text(
                  'View Details',
                  style: TextStyle(
                      color: Color.fromRGBO(16, 130, 235, 1),
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailsContainer extends StatelessWidget {
  final String orderID;
  final DateTime placedOn;
  final int itemNo;
  final double price;
  final VoidCallback onTap;

  const OrderDetailsContainer({
    required this.orderID,
    required this.placedOn,
    required this.itemNo,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        right: 8,
        left: 8,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 0), // controls the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: ' + orderID,
                    style: const TextStyle(
                      color: Color.fromRGBO(0, 124, 168, 1),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Placed On: ' + '$placedOn',
                    style: const TextStyle(
                      color: Color.fromRGBO(0, 124, 168, 1),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Delivery | ' + '$itemNo',
                    style: const TextStyle(
                      color: Color.fromRGBO(0, 124, 168, 1),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Order Total: Rs.' + '$price',
                    style: const TextStyle(
                      color: Color.fromRGBO(0, 124, 168, 1),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.file_copy_sharp,
                            size: 12,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Email Invoice',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
