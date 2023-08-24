import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'package:mothering_app/Screens/Shopping%20Section%20Screen/cartScreen.dart';
import 'package:mothering_app/models/cart_list_model.dart';
import 'dart:convert';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:mothering_app/models/cart_delete.dart';

class ItemOrderContainer extends StatefulWidget {
  final String itemName;
  final String colourName;
  final String sizeName;
  final int price;
  final int deprecatedPrice;
  // final DateTime deliveryDate;
  final List<String> imagePath;
  final String discountPercentage;
  final int id;
  final String quantity;

  const ItemOrderContainer({
    required this.itemName,
    required this.price,
    required this.deprecatedPrice,
    // required this.deliveryDate,
    required this.imagePath,
    required this.discountPercentage,
    required this.id,
    required this.quantity,
    required this.colourName,
    required this.sizeName,
  });

  @override
  State<ItemOrderContainer> createState() => _ItemOrderContainerState();
}

class _ItemOrderContainerState extends State<ItemOrderContainer> {
  Future<void> postRequest(int id) async {
    var url =
        'http://msocial-ecommerce.shivinfotechsolution.in/api/v1/cart-delete';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "User-Agent": "PostmanRuntime/7.30.0",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization":
          "eyJpdiI6ImdtSHgxRUlrdXBUZ0RHSTRVZGdnUEE9PSIsInZhbHVlIjoicForQ0xRbzhzaG0vVlVPbHM5cTVETkdJSFBBNjEzQnNaaHAxV2JDUmpMR0w0WVgybnRlZ2lhTENwM0JGZWorQVF1WjU5dWNqUHFvRG9UcFk4ZThpSXc9PSIsIm1hYyI6ImNhOGIwZDJjOWIzYjI5MjRkYzY3YTMxOGEyYTQxMDU2YzY5YjFjY2FjNWUwNmE0NjU0OGExZjc5MmE5NDJkODQiLCJ0YWciOiIifQ"
    };

    try {
      dio.FormData formData = dio.FormData.fromMap({
        "id": id,
      });
      var response = await dio.Dio().post(
        url,
        options: dio.Options(headers: headers),
        data: formData,
      );
      var jsonObject = jsonDecode(response.toString());
      print(jsonObject);

      if (response.statusCode == 200) {
        var deleteResponse = CartDelete.fromJson(jsonObject);

        if (deleteResponse.status == 200) {
          var products = await getCartList();
          print(products);
          Future.delayed(Duration.zero, () {
            pushNewScreen(
              context,
              screen: CartScreen(
                cartProducts: products,
              ),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          });
          // print('error 5');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(deleteResponse.message ?? ''),
            backgroundColor: Colors.redAccent,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to Delete Address"),
          ),
        );
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(top: 8.0),
        ),
      );
    }
  }

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
                        imagePath: widget.imagePath,
                        discountPercentage: 37,
                      ),
                      AddressDetailsContainer(
                        itemName_1: widget.itemName,
                        itemSize_1: '3-4Y',
                        price_1: widget.price,
                        deprecatedPrice_1: widget.deprecatedPrice,
                        idealWeight_1: '14 - 16.3',
                        // deliveryDate_1: deliveryDate,
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
                          ProductQuantity(
                            selectedValue: widget.quantity,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DeleteButton(
                            onTap: onTapDeleteAddress,
                          ),
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

  onTapDeleteAddress() {
    FocusManager.instance.primaryFocus?.unfocus();

    postRequest(
      widget.id,
    );
    // Timer(const Duration(seconds: 3), () {

    // });
  }
}

class AddressDetailsContainer extends StatelessWidget {
  final String itemName_1;
  final String itemSize_1;
  final int price_1;
  final int deprecatedPrice_1;
  final String idealWeight_1;
  // final DateTime deliveryDate_1;
  final String dispatchTime_1;

  AddressDetailsContainer({
    required this.itemName_1,
    required this.itemSize_1,
    required this.price_1,
    required this.deprecatedPrice_1,
    required this.idealWeight_1,
    // required this.deliveryDate_1,
    required this.dispatchTime_1,
  });

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormat.MMMEd().format(deliveryDate_1);

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
            const Row(
              children: [
                Icon(
                  Icons.fire_truck,
                  color: Color.fromRGBO(0, 160, 45, 1),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Get it by ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 160, 45, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                // Text(
                //   '$formattedDate',
                //   style: const TextStyle(
                //       color: Color.fromRGBO(0, 160, 45, 1),
                //       fontSize: 12,
                //       fontWeight: FontWeight.normal),
                // ),
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
  final VoidCallback onTap;

  DeleteButton({
    required this.onTap,
  });
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
            onPressed: onTap,
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
  final List<String> imagePath;
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
                imagePath[0],
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
    this.selectedValue,
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
