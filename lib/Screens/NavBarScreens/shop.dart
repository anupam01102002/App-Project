import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/child_details_container.dart';
import 'package:mothering_app/CustomWidgets/deliveryLocationContainer.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/productcard_1.dart';
import 'package:mothering_app/CustomWidgets/subtitle.dart';
import 'package:mothering_app/Screens/Shopping%20Section%20Screen/shopping.dart';
import 'package:mothering_app/Screens/other%20Screens/child_details.dart';
import 'package:time_machine/time_machine.dart';
import '../../CustomWidgets/custombutton.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MotheringShopScreen extends StatefulWidget {
  final String? name;
  final String? dob;
  final Period? months;
  final bool? show;


  MotheringShopScreen({
    this.name,
    this.dob,
    this.show,
    this.months,
  });

  @override
  State<MotheringShopScreen> createState() => _MotheringShopScreenState();
}

class _MotheringShopScreenState extends State<MotheringShopScreen> {
  bool childDetailsAreNull = false;

  @override
  void initState() {
    super.initState();

    // Call the function to update childDetailsAreNull
    updateChildDetailsAreNull();
  }

  void updateChildDetailsAreNull() {
    setState(() {
      childDetailsAreNull = widget.show == null ? false : true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(243, 252, 255, 1),
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      body: Center(
        child: Column(
          children: [
            Visibility(
              visible: !childDetailsAreNull,
              child: Container(
                height: 40,
                width: double.infinity,
                color: Colors.white,
                child: TextButton(
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: ChildDetails(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: const Text(
                    '+ Add Child',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: childDetailsAreNull,
              child: DeliveryLocationContainer(),
            ),
            Visibility(
              visible: childDetailsAreNull,
              child: ChildDetailsContainer(
                name: widget.name,
                dob: widget.dob,
                months: widget.months,
              ),
            ),
            // Shop by Category Text
            const Subtitle(
                textColor: Color.fromRGBO(0, 124, 168, 1),
                containerColor: Color.fromRGBO(0, 124, 168, 1),
                containerHeight: 35,
                containerWidth: 8,
                enterText: 'Shop By Category'),
            // Category Buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      width: 170,
                      fillColor: Colors.white,
                      borderColor: const Color.fromRGBO(0, 124, 168, 1),
                      textColor: const Color.fromRGBO(0, 124, 168, 1),
                      buttonName: 'BOYS FASHION',
                      onPressed: () {
                        pushNewScreen(
                          context,
                          screen: ShoppingScreen(),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      }),
                  CustomButton(
                      width: 170,
                      fillColor: Colors.white,
                      borderColor: const Color.fromRGBO(0, 124, 168, 1),
                      textColor: const Color.fromRGBO(0, 124, 168, 1),
                      buttonName: 'GIRLS FASHION',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingScreen()),
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      width: 170,
                      fillColor: Colors.white,
                      borderColor: const Color.fromRGBO(0, 124, 168, 1),
                      textColor: const Color.fromRGBO(0, 124, 168, 1),
                      buttonName: 'BEST SELLER',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingScreen()),
                        );
                      }),
                  CustomButton(
                      width: 170,
                      fillColor: Colors.white,
                      borderColor: const Color.fromRGBO(0, 124, 168, 1),
                      textColor: const Color.fromRGBO(0, 124, 168, 1),
                      buttonName: 'SALE 50%OFF',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingScreen()),
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      width: 170,
                      fillColor: Colors.white,
                      borderColor: const Color.fromRGBO(0, 124, 168, 1),
                      textColor: const Color.fromRGBO(0, 124, 168, 1),
                      buttonName: 'ETHICAL WEAR',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingScreen()),
                        );
                      }),
                  CustomButton(
                      width: 170,
                      fillColor: Colors.white,
                      borderColor: const Color.fromRGBO(0, 124, 168, 1),
                      textColor: const Color.fromRGBO(0, 124, 168, 1),
                      buttonName: 'MOTHER\'S CHOICE',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingScreen()),
                        );
                      }),
                ],
              ),
            ),
            //New Arrival Text
            const Subtitle(
              textColor: Color.fromRGBO(0, 124, 168, 1),
              containerHeight: 35,
              containerWidth: 8,
              enterText: 'New Arrival',
              containerColor: Color.fromRGBO(0, 124, 168, 1),
            ),

            //List View
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                height: 200,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    ProductCard(
                      deprecatedPrice: 200,
                      itemPrice: 200,
                      itemName: 'Baby Sweater Full Sleeves',
                      brandName: 'brandName',
                      imagePath: 'assets/images/Cloth_1.png',
                    ),
                    ProductCard(
                      deprecatedPrice: 200,
                      itemPrice: 200,
                      itemName: 'Baby Sweater Full Sleeves',
                      brandName: 'brandName',
                      imagePath: 'assets/images/Cloth_1.png',
                    ),
                    ProductCard(
                      deprecatedPrice: 200,
                      itemPrice: 200,
                      itemName: 'Baby Sweater Full Sleeves',
                      brandName: 'brandName',
                      imagePath: 'assets/images/Cloth_1.png',
                    ),
                    ProductCard(
                      deprecatedPrice: 200,
                      itemPrice: 200,
                      itemName: 'Baby Sweater Full Sleeves',
                      brandName: 'brandName',
                      imagePath: 'assets/images/Cloth_1.png',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
