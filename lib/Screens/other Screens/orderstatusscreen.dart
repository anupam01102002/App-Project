import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/orderstatusscreen_container.dart';
import 'package:mothering_app/Screens/other%20Screens/orderstatusdetails_Screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                right: 8,
                left: 8,
                bottom: 1,
              ),
              child: Container(
                width: double.infinity,
                // height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromRGBO(124, 219, 253, 1),
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'All Orders',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            OrderStatusScreenContainer(
              orderID: 4564681,
              orderDate: DateTime.now(),
              itemName: 'itemName',
              deliveryDate: DateTime.now(),
              imagePath: 'assets/images/Cloth_1.png',
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: OrderStatusDetailsScreen(
                    itemName: 'itemName',
                    price: 213,
                    deprecatedPrice: 132,
                    deliveryDate: DateTime.now(),
                    imagePath: 'assets/images/Cloth_1.png',
                    discountPercentage: 23,
                  ),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
