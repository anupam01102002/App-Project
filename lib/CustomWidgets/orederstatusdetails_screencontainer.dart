import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderStatusScreenDetailsContainer extends StatelessWidget {
  final int orderID;
  final DateTime orderDate;
  final String itemName;
  final DateTime deliveryDate;
  final DateTime returnDate;
  final String imagePath;
  final VoidCallback onPressed;

  OrderStatusScreenDetailsContainer({
    required this.orderID,
    required this.orderDate,
    required this.itemName,
    required this.deliveryDate,
    required this.imagePath,
    required this.onPressed,
    required this.returnDate,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate_1 = DateFormat.MMMEd().format(returnDate);
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 8,
        left: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 0), // changes the position of the shadow
            ),
          ],
        ),
        child: Column(
          children: [
            ItemOrderContainer(
              itemName: itemName,
              deliveryDate: deliveryDate,
              imagePath: imagePath,
              onPressed: onPressed,
              returnDate: formattedDate_1,
            )
          ],
        ),
      ),
    );
  }
}

class ItemOrderContainer extends StatelessWidget {
  final String itemName;
  final DateTime deliveryDate;
  final String returnDate;
  final String imagePath;
  final VoidCallback onPressed;

  const ItemOrderContainer({
    required this.itemName,
    required this.deliveryDate,
    required this.imagePath,
    required this.onPressed,
    required this.returnDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImage(
                    imagePath: imagePath,
                    discountPercentage: 37,
                  ),
                  AddressDetailsContainer(
                    itemName_1: 'itemName_1',
                    itemPrice_1: 123.32,
                    quantity_1: 1,
                    age_1: '9 - 14M',
                    color_1: 'RED',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  deliveryDateContainer(
                    deliveryDate: deliveryDate,
                  ),
                  Container(
                    child: Row(
                      children: [
                        const Text(
                          'Return ',
                          style: TextStyle(
                            color: Color.fromRGBO(2, 160, 216, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(before $returnDate)',
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddressDetailsContainer extends StatelessWidget {
  final String itemName_1;
  final double itemPrice_1;
  final int quantity_1;
  final String age_1;
  final String color_1;

  AddressDetailsContainer({
    required this.itemName_1,
    required this.itemPrice_1,
    required this.quantity_1,
    required this.age_1,
    required this.color_1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                itemName_1,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Rs. ' + '$itemPrice_1',
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ordered Quantities: ' + '$quantity_1',
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Size: ' + '$age_1  |  ',
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Color: ' + '$color_1',
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String imagePath;
  final int discountPercentage;

  const ProductImage({
    required this.imagePath,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class deliveryDateContainer extends StatelessWidget {
  final DateTime deliveryDate;

  const deliveryDateContainer({
    required this.deliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate_1 = DateFormat.MMMEd().format(deliveryDate);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivered',
            style: TextStyle(
              color: Color.fromRGBO(0, 160, 45, 1),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            formattedDate_1,
            style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
