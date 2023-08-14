import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String brandName;
  final String itemName;
  final String imagePath;
  final double itemPrice;
  final double deprecatedPrice;

  const ProductCard({
    required this.deprecatedPrice,
    required this.itemPrice,
    required this.itemName,
    required this.brandName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          border:
              Border.all(color: Colors.grey), // Set the border color to grey
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 120,
                height: 140,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName,
                    style: const TextStyle(
                        color: Color.fromRGBO(137, 137, 137, 1), fontSize: 9),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    itemName,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        '$itemPrice',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '$deprecatedPrice',
                        style: const TextStyle(
                          fontSize: 6,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(137, 137, 137, 1),
                        ),
                      ),
                    ],
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
