import 'package:flutter/material.dart';
import 'package:mothering_app/Screens/other%20Screens/placeorder_withAddress_Screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavigationBar_OrderScreen extends StatefulWidget {
  final double finalPrice;
  final String itemName;
  final double price;
  final double deprecatedPrice;
  final DateTime deliveryDate;
  final String imagePath;
  final int discountPercentage;

  const BottomNavigationBar_OrderScreen({
    required this.finalPrice,
    required this.itemName,
    required this.price,
    required this.deprecatedPrice,
    required this.deliveryDate,
    required this.imagePath,
    required this.discountPercentage,
  });

  @override
  _BottomNavigationBar_OrderScreenState createState() =>
      _BottomNavigationBar_OrderScreenState();
}

class _BottomNavigationBar_OrderScreenState
    extends State<BottomNavigationBar_OrderScreen> {
  int _selectedIndex = 0;
  String _selectedGender = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Show modal screen based on selected index
    switch (index) {
      case 0:
        break;
      case 1:
        pushNewScreen(
          context,
          screen: PlaceOrderWithAddressScreen(
              itemName: widget.itemName,
              price: widget.price,
              deprecatedPrice: widget.deprecatedPrice,
              deliveryDate: widget.deliveryDate,
              imagePath: widget.imagePath,
              discountPercentage: widget.discountPercentage),
          withNavBar: true, // OPTIONAL VALUE. True b y default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
    }
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
              width: MediaQuery.of(context).size.width * 0.5,
              child: Bottom_Nav_Bar_Age_Container(
                text: '${widget.finalPrice}',
                isSelected: _selectedIndex == 0,
                onTap: () => _onItemTapped(0),
              ),
            ),
            Expanded(
              child: BottomNavBarItem(
                text: 'PLACE ORDER',
                isSelected: _selectedIndex == 1,
                onTap: () => _onItemTapped(1),
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
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
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
