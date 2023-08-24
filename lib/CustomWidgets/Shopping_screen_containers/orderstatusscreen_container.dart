import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mothering_app/models/orders_model.dart';

class OrderStatusScreenContainer extends StatelessWidget {
  final String orderID;
  final String orderDate;
  final List<OrderProducts> productsList;
  final String itemName;
  final DateTime deliveryDate;
  final VoidCallback onPressed;

  OrderStatusScreenContainer({
    required this.orderID,
    required this.orderDate,
    required this.itemName,
    required this.deliveryDate,
    required this.onPressed,
    required this.productsList,
  });

  @override
  Widget build(BuildContext context) {
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
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 0), // changes the position of the shadow
            ),
          ],
        ),
        child: Column(
          children: [
            OrderDateContainer(
              orderID: '$orderID',
              orderDate: orderDate,
            ),
            Container(
              height: 130 * productsList.length.toDouble(),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                itemCount: productsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Products = productsList[index];
                  return ItemOrderContainer(
                    itemName: Products.productName!,
                    imagePath: Products.image!,
                    color_name: Products.colorName!,
                    size_name: Products.sizeName!,
                    status_string: Products.statusString!,
                    status: Products.status!,
                    deliveryDate: deliveryDate,
                    onPressed: onPressed,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDateContainer extends StatelessWidget {
  final String orderID;
  final String orderDate;

  OrderDateContainer({
    required this.orderID,
    required this.orderDate,
  });

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormat.MMMEd().format(orderDate);

    return Container(
      height: 24,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(86, 210, 254, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      padding: const EdgeInsets.all(6.0),
      child: Text(
        '  Order- ' + orderID + ' / ' + orderDate,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class ItemOrderContainer extends StatelessWidget {
  final String itemName;
  final String color_name;
  final String size_name;
  final DateTime deliveryDate;
  final String imagePath;
  final String status_string;
  final String status;
  final VoidCallback onPressed;

  const ItemOrderContainer({
    required this.itemName,
    required this.deliveryDate,
    required this.imagePath,
    required this.onPressed,
    required this.color_name,
    required this.size_name,
    required this.status_string,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
                    itemName_1: itemName,
                    deliveryDate_1: deliveryDate,
                  ),
                ],
              ),
            ),
            ItemDetailsContainer(
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class AddressDetailsContainer extends StatelessWidget {
  final String itemName_1;
  final DateTime deliveryDate_1;

  AddressDetailsContainer({
    required this.itemName_1,
    required this.deliveryDate_1,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.MMMEd().format(deliveryDate_1);

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemName_1,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivery Date',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 160, 45, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 160, 45, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
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
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height * 0.27 * 0.09,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '$discountPercentage' + '% OFF',
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDetailsContainer extends StatelessWidget {
  final VoidCallback onPressed;

  const ItemDetailsContainer({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: onPressed,
          child: const Text(
            'View Details  > ',
            style:
                TextStyle(color: Color.fromRGBO(0, 124, 168, 1), fontSize: 12),
          )),
    );
  }
}
