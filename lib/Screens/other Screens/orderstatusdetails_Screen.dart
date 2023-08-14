import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/addressContainer.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/orederstatusdetails_screencontainer.dart';
import 'package:mothering_app/Screens/other%20Screens/orderplacedsuccess_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class OrderStatusDetailsScreen extends StatelessWidget {
  final String itemName;
  final double price;
  final double deprecatedPrice;
  final DateTime deliveryDate;
  final String imagePath;
  final int discountPercentage;

  OrderStatusDetailsScreen({
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
      resizeToAvoidBottomInset: false,
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderDetailsContainer(
              orderID: '1234141',
              placedOn: DateTime.now(),
              itemNo: 1,
              price: price,
              onTap: () {pushNewScreen(
                context,
                screen: OrderPlacedSuccessScreen(price: price,),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );},
            ),
            OrderStatusScreenDetailsContainer(
              orderID: 4564681,
              orderDate: DateTime.now(),
              itemName: 'itemName',
              deliveryDate: DateTime.now(),
              returnDate: DateTime.now(),
              imagePath: 'assets/images/Cloth_1.png',
              onPressed: () {},
            ),
            AddressContainer(
                tagName: '',
                userName: 'userName',
                blockNo: 'blockNo',
                pincode: 123124,
                cityName: 'cityName',
                landmarkName: 'landmarkName',
                streetAddress: 'streetAddress',
                phoneNumber: 1234124423),
            const PaymentDetailsContainer(
              valueOfProducts: 728.50,
              discount: 146.55,
              estimatedGST: 27.57,
              shipping: 50.00,
            ),
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
              color: Color.fromARGB(255, 73, 198, 212).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes the position of the shadow
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PaymentTextContainer(
                    text: 'Item(s)\nSubtotal (Including Taxes)',
                    price: '2123',
                    textColor: Colors.black,
                    priceColor: Colors.black,
                  ),
                  PaymentTextContainer(
                    text: 'Shipping Charges',
                    price: '0',
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    priceColor: Color.fromARGB(255, 255, 0, 0),
                  ),
                  PaymentTextContainer(
                    text: 'Gift Wrap',
                    price: '30',
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    priceColor: Color.fromARGB(255, 255, 0, 0),
                  ),
                  PaymentTextContainer(
                    text: 'Order Total',
                    price: '688.55',
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    priceColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                  PaymentTextContainer(
                    text: 'Net Payment',
                    price: '30',
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    priceColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                  PaymentTextContainer(
                    text: 'Payment Method',
                    price: '30',
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    priceColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                  PaymentTextContainer(
                    text: 'Payment Status',
                    price: '30',
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    priceColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                  PaymentTextContainer(
                    text: 'Taxes',
                    price: '30',
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    priceColor: Color.fromARGB(255, 0, 0, 0),
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

class PaymentTextContainer extends StatelessWidget {
  final String text;
  final String price;
  final Color textColor;
  final Color priceColor;

  const PaymentTextContainer({
    required this.text,
    required this.price,
    required this.textColor,
    required this.priceColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
              ),
            ),
            Text(
              'Rs. ' + '$price',
              style: TextStyle(
                color: priceColor,
                fontSize: 14,
              ),
            ),
          ],
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
