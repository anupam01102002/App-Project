import 'package:flutter/material.dart';
import 'package:mothering_app/Screens/Shopping%20Section%20Screen/cartScreen.dart';
import 'package:mothering_app/models/cart_add_or_update_model.dart';
// import 'package:mothering_app/models/Address_model.dart';
import 'package:mothering_app/models/cart_list_model.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:convert';
import 'dart:async';

class BottomNavigationBar_ShoppingDetailsScreen extends StatefulWidget {
  final DateTime deliveryDate;
  final String itemName;
  final String imagePath;
  final double itemPrice;
  final int discountPercentage;
  final double deprecatedPrice;

  const BottomNavigationBar_ShoppingDetailsScreen({
    required this.deprecatedPrice,
    required this.itemPrice,
    required this.itemName,
    required this.imagePath,
    required this.deliveryDate,
    required this.discountPercentage,
  });

  @override
  _BottomNavigationBar_ShoppingDetailsScreenState createState() =>
      _BottomNavigationBar_ShoppingDetailsScreenState();
}

class _BottomNavigationBar_ShoppingDetailsScreenState
    extends State<BottomNavigationBar_ShoppingDetailsScreen> {
  int _selectedIndex = 0;
  String _selectedGender = '';

  Future<void> AddorUpdateCartPostRequest(
    int variationId,
    int productId,
    int colorId,
    int sizeId,
    String qty,
  ) async {
    var url =
        'http://msocial-ecommerce.shivinfotechsolution.in/api/v1/cartAddOrUpdate';
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
        "variationId": variationId,
        "productId": productId,
        "colorId": colorId,
        "sizeId": sizeId,
        "qty": qty,
      });

      var response = await dio.Dio().post(
        url,
        options: dio.Options(
          headers: headers,
        ),
        data: formData,
      );

      var jsonObject = jsonDecode(response.toString());

      if (response.statusCode == 200) {
        var loginResponse = CartAddorUpdate.fromJson(jsonObject);
        print(response);

        if (loginResponse.status == 200) {
          print(response);
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => OtpScreen(mobileNumber: mobileNumber),
          // ));
        } else {
          print(response);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(loginResponse.message ?? ''),
            backgroundColor: Colors.redAccent,
          ));
        }
      } else {
        print(response);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sending Message"),
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
      // } finally {
      //   Timer(const Duration(seconds: 3), () {
      //     mobilenumberController.clear();
      //   });
    }
  }

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    // Show modal screen based on selected index
    // print(index);
    switch (index) {
      case 0:
        _showAgeModal(context);
        break;
      case 1:
        {
          // print('Button Pressed');
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
        }
        ;
        break;
      default:
        print(index);
        break;
    }
  }

  void _showAgeModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 110,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'BOY',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Radio(
                        value: 'BOY',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'GIRL',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Radio(
                        value: 'GIRL',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Apply'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Adjust the height as needed
          child: const Center(
            child: Text('Filter Modal'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final barHeight = screenHeight * 0.06;

    return SizedBox(
      height: barHeight,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 124, 168, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Bottom_Nav_Bar_Age_Container(
                text: '6 - 9 M',
                isSelected: _selectedIndex == 0,
                onTap: () => _onItemTapped(0),
              ),
            ),
            Expanded(
              child: BottomNavBarItem(
                text: 'ADD TO CART',
                isSelected: _selectedIndex == 1,
                onTap: () async {
                  AddorUpdateCartPostRequest(
                    1,
                    1,
                    1,
                    1,
                    '2',
                  );
                  print('Hello');
                  _onItemTapped(1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavBarItem({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Bottom_Nav_Bar_Age_Container extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const Bottom_Nav_Bar_Age_Container({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: double.infinity,
        color: const Color.fromRGBO(129, 129, 129, 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(163, 231, 255, 1),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 124, 168, 1),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromRGBO(0, 124, 168, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
