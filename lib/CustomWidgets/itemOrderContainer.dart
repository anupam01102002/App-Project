import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemOrderContainer extends StatelessWidget {
  final String itemName;
  final double price;
  final double deprecatedPrice;
  final DateTime deliveryDate;
  final String imagePath;
  final int discountPercentage;

  const ItemOrderContainer({
    required this.itemName,
    required this.price,
    required this.deprecatedPrice,
    required this.deliveryDate,
    required this.imagePath,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes the position of the shadow
            ),
          ],
        ),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        itemSize_1: '3-4Y',
                        price_1: price,
                        deprecatedPrice_1: deprecatedPrice,
                        idealWeight_1: '14 - 16.3',
                        deliveryDate_1: deliveryDate,
                        dispatchTime_1: '24 Hours',
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          ProductQuantity(),
                        ],
                      ),
                      Row(
                        children: [
                          DeleteButton(),
                          const SizedBox(
                            width: 12,
                          ),
                          FavouriteButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressDetailsContainer extends StatelessWidget {
  final String itemName_1;
  final String itemSize_1;
  final double price_1;
  final double deprecatedPrice_1;
  final String idealWeight_1;
  final DateTime deliveryDate_1;
  final String dispatchTime_1;

  AddressDetailsContainer({
    required this.itemName_1,
    required this.itemSize_1,
    required this.price_1,
    required this.deprecatedPrice_1,
    required this.idealWeight_1,
    required this.deliveryDate_1,
    required this.dispatchTime_1,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.MMMEd().format(deliveryDate_1);

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName_1,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Size: ' + itemSize_1,
              style: const TextStyle(
                  color: Color.fromRGBO(150, 150, 150, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  'Rs. ' + '$price_1',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '$deprecatedPrice_1',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 8,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'MRP inccl. of all taxes',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 8,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Text(
              'Ideal Weight (Kgs): ' + idealWeight_1,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
            Row(
              children: [
                Icon(
                  Icons.fire_truck,
                  color: Color.fromRGBO(0, 160, 45, 1),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'Get it by ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 160, 45, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  '$formattedDate',
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 160, 45, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const Text(
                  'Dispatch time: ',
                  style: TextStyle(
                      color: Color.fromRGBO(54, 102, 149, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  dispatchTime_1,
                  style: const TextStyle(
                      color: Color.fromRGBO(54, 102, 149, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(246, 246, 246, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey, // Adding grey border color
          width: 1,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 1.5, // Adjust this value to control the size of the icon
          heightFactor:
              1.5, // Adjust this value to control the size of the icon
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: const Color.fromRGBO(150, 150, 150, 1),
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}

class FavouriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(246, 246, 246, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey, // Adding grey border color
          width: 1,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 1.5, // Adjust this value to control the size of the icon
          heightFactor:
              1.5, // Adjust this value to control the size of the icon
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outlined),
            color: const Color.fromRGBO(150, 150, 150, 1),
            iconSize: 18,
          ),
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
              child: Image.asset(
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

class ProductQuantity extends StatefulWidget {
  String? selectedValue;

  ProductQuantity({
    this.selectedValue = '1',
  });

  @override
  State<ProductQuantity> createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
  final List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: false,
            hint: const Text(
              'Qty: ',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        'Qty: ' + item,
                        style: const TextStyle(
                            fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ))
                .toList(),
            value: widget.selectedValue,
            onChanged: (String? value) {
              setState(() {
                widget.selectedValue = value;
              });
            },
            style: const TextStyle(
              fontSize: 14,
            ),
            dropdownColor: const Color.fromARGB(255, 255, 255, 255),
            underline: Container(
              height: 1,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
    );
  }
}
