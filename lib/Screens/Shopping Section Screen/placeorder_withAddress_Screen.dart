import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/addressContainer.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/bottom_navigation_bars/bottomnavigationbarwithaddress_orderpage.dart';
import 'package:mothering_app/CustomWidgets/Shopping_screen_containers/giftcheckbox.dart';
import 'package:mothering_app/CustomWidgets/Shopping_screen_containers/giftcontainer.dart';
import 'package:mothering_app/CustomWidgets/app_drawer/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/Shopping_screen_containers/quickgrabcontainer.dart';
import 'package:mothering_app/CustomWidgets/subtitle.dart';

class PlaceOrderWithAddressScreen extends StatelessWidget {
  final String itemName;
  final double price;
  final double deprecatedPrice;
  final DateTime deliveryDate;
  final String imagePath;
  final int discountPercentage;

  PlaceOrderWithAddressScreen({
    required this.itemName,
    required this.price,
    required this.deprecatedPrice,
    required this.deliveryDate,
    required this.imagePath,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      bottomNavigationBar: BottomNavigationBarWithAddress_OrderScreen(
        finalPrice: 768.42,
        itemName: itemName,
        price: price,
        deprecatedPrice: deprecatedPrice,
        deliveryDate: deliveryDate,
        imagePath: imagePath,
        discountPercentage: discountPercentage,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Subtitle(
              containerHeight: 20,
              containerWidth: 12,
              enterText: 'ADDRESS/SUMMARY',
              textColor: Colors.black,
              containerColor: Color.fromRGBO(124, 218, 252, 1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 1,
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
                          '+ Change/Add Address',
                          style: TextStyle(
                            color: Color.fromRGBO(54, 102, 149, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AddressContainer(
              state: 'address.type!',
              tagName: '',
              userName: 'userName',
              blockNo: 'blockNo',
              pincode: 123124,
              cityName: 'cityName',
              landmarkName: 'landmarkName',
              streetAddress: 'streetAddress',
              phoneNumber: '1234124423',
              id: 4,
              type: 1,
            ),
            Container(
              height: 5,
              width: double.infinity,
              color: const Color.fromRGBO(163, 231, 255, 1),
            ),
            const GiftContainer(
              receiverName: 'Ravindra',
              senderName: 'Mitesh',
              message: 'message',
            ),
            // ItemOrderContainer(
            //   itemName: itemName,
            //   price: price,
            //   deprecatedPrice: deprecatedPrice,
            //   deliveryDate: deliveryDate,
            //   imagePath: imagePath,
            //   discountPercentage: discountPercentage,
            // ),
            // ItemOrderContainer(
            //   itemName: itemName,
            //   price: price,
            //   deprecatedPrice: deprecatedPrice,
            //   deliveryDate: deliveryDate,
            //   imagePath: imagePath,
            //   discountPercentage: discountPercentage,
            // ),
            Padding(
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
                      offset: const Offset(
                          0, 0), // changes the position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 24,
                      ),
                      child: Text(
                        'Quick Grab Suggestions For you',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: 210,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: const [
                            QuickGrabContainer(
                              itemName: 'widget.itemName!',
                              price: 1231,
                              deprecatedPrice: 1231,
                              imagePath: 'assets/images/Cloth_1.png',
                              discountPercentage: 12,
                            ),
                            QuickGrabContainer(
                              itemName: 'widget.itemName!',
                              price: 1231,
                              deprecatedPrice: 1231,
                              imagePath: 'assets/images/Cloth_1.png',
                              discountPercentage: 12,
                            ),
                            QuickGrabContainer(
                              itemName: 'widget.itemName!',
                              price: 1231,
                              deprecatedPrice: 1231,
                              imagePath: 'assets/images/Cloth_1.png',
                              discountPercentage: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
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
                      offset: const Offset(
                          0, 0), // changes the position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 24,
                      ),
                      child: Text(
                        'Trending Items',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: 210,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: const [
                            QuickGrabContainer(
                              itemName: 'widget.itemName!',
                              price: 1231,
                              deprecatedPrice: 1231,
                              imagePath: 'assets/images/Cloth_1.png',
                              discountPercentage: 12,
                            ),
                            QuickGrabContainer(
                              itemName: 'widget.itemName!',
                              price: 1231,
                              deprecatedPrice: 1231,
                              imagePath: 'assets/images/Cloth_1.png',
                              discountPercentage: 12,
                            ),
                            QuickGrabContainer(
                              itemName: 'widget.itemName!',
                              price: 1231,
                              deprecatedPrice: 1231,
                              imagePath: 'assets/images/Cloth_1.png',
                              discountPercentage: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GiftCheckBox(),
            const PaymentDetailsContainer(
                valueOfProducts: 728.50,
                discount: 146.55,
                estimatedGST: 27.57,
                shipping: 50.00)
          ],
        ),
      ),
    );
  }
}

class PaymentDetailsContainer extends StatelessWidget {
  final double valueOfProducts;
  final double discount;
  final double estimatedGST;
  final double shipping;

  const PaymentDetailsContainer({
    required this.valueOfProducts,
    required this.discount,
    required this.estimatedGST,
    required this.shipping,
  });

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
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Payment Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Value of Products',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Discount(-)',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Estimated GST (+)',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shipping',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rs. ' + '$valueOfProducts',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rs. ' + '$discount',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rs. ' + '$estimatedGST',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rs. ' + '$shipping',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color.fromRGBO(148, 227, 255, 1),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sub Total',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Container(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rs. ' + '$valueOfProducts',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color.fromRGBO(148, 227, 255, 1),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Final Total',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 124, 168, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Container(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rs. ' + '$valueOfProducts',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 124, 168, 1),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
    );
  }
}
