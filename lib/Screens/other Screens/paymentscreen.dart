import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/subtitle.dart';
import 'package:mothering_app/Screens/other%20Screens/COD%20otp%20screen.dart';
import 'package:mothering_app/Screens/other%20Screens/orderstatusscreen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Subtitle(
            containerHeight: 15,
            containerWidth: 10,
            enterText: 'PAYMENT',
            textColor: Colors.black,
            containerColor: Color.fromRGBO(124, 218, 252, 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 6,
            ),
            child: Container(
              child: Text(
                'Select Payment Option',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          PaymentContainer(
            name: 'CREDIT/DEBIT CARDS',
            iconImagePath: 'assets/images/Creditcard_icon.png',
            ontap: () {
              pushNewScreen(
                context,
                screen: OrderStatusScreen(),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
          PaymentContainer(
            name: 'UPI',
            iconImagePath: 'assets/images/UPI_icon.png',
            ontap: () {
              pushNewScreen(
                context,
                screen: CODOTPVerificationScreen(),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
          PaymentContainer(
            name: 'PAYTM',
            iconImagePath: 'assets/images/Paytm_icon.png',
            ontap: () {},
          ),
          PaymentContainer(
            name: 'NET BANKING',
            iconImagePath: 'assets/images/Mobile_icon.png',
            ontap: () {},
          ),
          PaymentContainer(
            name: 'CASH ON DELIVERY',
            iconImagePath: 'assets/images/Rupee_icon.png',
            ontap: () {},
          ),
          PaymentContainer(
            name: 'EMI',
            iconImagePath: 'assets/images/EMI_icon.png',
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

class PaymentContainer extends StatelessWidget {
  final String name;
  final String iconImagePath;
  final VoidCallback ontap;

  PaymentContainer({
    required this.name,
    required this.iconImagePath,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 6),
                    child: Image.asset(
                      iconImagePath,
                      width: 24, // Adjust the width as needed.
                      height: 24, // Adjust the height as needed.
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
