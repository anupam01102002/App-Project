import 'package:flutter/material.dart';

class QuickGrabContainer extends StatelessWidget {
  final String itemName;
  final double price;
  final double deprecatedPrice;
  final String imagePath;
  final int discountPercentage;

  const QuickGrabContainer({
    required this.itemName,
    required this.price,
    required this.deprecatedPrice,
    required this.imagePath,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 120,
                height: 140,
                child: ProductImage(
                  imagePath: imagePath,
                  discountPercentage: 37,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        'Rs. ' + '$price',
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
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 15,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'ADD TO CART',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
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
