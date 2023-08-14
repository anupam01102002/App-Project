import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard_2 extends StatelessWidget {
  final String brandName;
  final DateTime deliveryDate;
  final String itemName;
  final String imagePath;
  final double itemPrice;
  final int discountPercentage;
  final double deprecatedPrice;
  final VoidCallback onPressed;
  final Color borderColor;

  const ProductCard_2({
    required this.deprecatedPrice,
    required this.itemPrice,
    required this.itemName,
    required this.brandName,
    required this.imagePath,
    required this.deliveryDate,
    required this.discountPercentage,
    required this.onPressed,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.MMMEd().format(deliveryDate);

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.27,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: borderColor,
                  width: 2.0,
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(00.0),
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
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.27 * 0.12,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '$discountPercentage' + '% OFF',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  right: 10.0,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 18,
                      ),
                      alignment: Alignment.center,
                      color: Color.fromRGBO(124, 219, 253, 1),
                      onPressed: () {
                        // Add your camera button functionality here
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: borderColor,
                  width: 2.0,
                ),
                bottom: BorderSide(
                  color: borderColor,
                  width: 2.0,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(137, 137, 137, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    itemName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rs.' + '$itemPrice',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '  ' + '$deprecatedPrice',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(137, 137, 137, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Get it By',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(137, 137, 137, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
