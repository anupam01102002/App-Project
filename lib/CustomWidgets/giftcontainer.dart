import 'package:flutter/material.dart';

class GiftContainer extends StatelessWidget {
  final String receiverName;
  final String senderName;
  final String message;

  const GiftContainer({
    required this.receiverName,
    required this.senderName,
    required this.message,
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
                      const ProductImage(
                        imagePath: 'assets/images/Gifts.png',
                      ),
                      GiftDetailsContainer(
                        receiverName: receiverName,
                        senderName: senderName,
                        message: message,
                      )
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
                          DeleteButton(),
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

class GiftDetailsContainer extends StatelessWidget {
  final String receiverName;
  final String senderName;
  final String message;

  const GiftDetailsContainer({
    required this.receiverName,
    required this.senderName,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Text(
                'Gift Wrap',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Row(
                children: [
                  Text(
                    'Rs. ' + '30.00',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'MRP inccl. of all taxes',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 8,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Row(
                children: [
                  const Text(
                    'To: ',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    receiverName,
                    style: const TextStyle(
                        color: Color.fromRGBO(54, 102, 149, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text( 
                    'From: ',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    senderName,
                    style: const TextStyle(
                        color: Color.fromRGBO(54, 102, 149, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Row(
                children: [
                  const Text(
                    'Message: ',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
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

  const ProductImage({
    required this.imagePath,
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
        ],
      ),
    );
  }
}
