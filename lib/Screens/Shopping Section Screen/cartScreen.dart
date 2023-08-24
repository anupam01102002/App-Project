import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/bottom_navigation_bars/BottomNavigationBar_orderpage.dart';
import 'package:mothering_app/CustomWidgets/Shopping_screen_containers/giftcheckbox.dart';
import 'package:mothering_app/CustomWidgets/Shopping_screen_containers/itemOrderContainer.dart';
import 'package:mothering_app/CustomWidgets/app_drawer/motheringAppBarDrawer.dart';
import 'package:mothering_app/models/cart_list_model.dart';
import 'package:mothering_app/CustomWidgets/Shopping_screen_containers/quickgrabcontainer.dart';

class CartScreen extends StatefulWidget {
  final List<Carts>? cartProducts;

  const CartScreen({
    super.key,
    this.cartProducts,
  });
  @override
  State<CartScreen> createState() => _CartScreenState(cartProducts!);
}

class _CartScreenState extends State<CartScreen> {
  final List<Carts> cartProducts;

  _CartScreenState(this.cartProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      bottomNavigationBar: BottomNavigationBar_OrderScreen(
        finalPrice: 768.42,
        itemName: "widget.itemName!",
        price: 123412,
        deprecatedPrice: 123,
        deliveryDate: DateTime.now(),
        imagePath: "widget.imagePath!",
        discountPercentage: 23452,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: cartProducts.length * 150,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                itemCount: cartProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final cartProduct =
                      cartProducts[index]; // Get the current Addresses object
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ItemOrderContainer(
                      itemName: cartProduct.name!,
                      price: (cartProduct.price! - cartProduct.discount!),
                      deprecatedPrice: cartProduct.price!,
                      // deliveryDate: cartProduct.deliveryDate!,
                      imagePath: [cartProduct.images!][0],
                      discountPercentage: cartProduct.discountPercentage!,
                      id: cartProduct.id!,
                      quantity: cartProduct.qty!,
                      colourName: cartProduct.colorName!,
                      sizeName: cartProduct.sizeName!,
                    ),
                  );
                },
              ),
            ),

            // const GiftContainer(
            //   receiverName: 'Ravindra',
            //   senderName: 'Mitesh',
            //   message: 'message',
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
