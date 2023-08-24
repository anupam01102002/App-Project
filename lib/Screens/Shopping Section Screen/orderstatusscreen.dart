import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/app_drawer/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/Shopping_screen_containers/orderstatusscreen_container.dart';
import 'package:mothering_app/Screens/Shopping%20Section%20Screen/orderstatusdetails_Screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:mothering_app/models/orders_model.dart';

class OrderStatusScreen extends StatefulWidget {
  final List<Orders> OrdersList;

  const OrderStatusScreen({
    super.key,
    required this.OrdersList,
  });

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState(OrdersList);
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  final List<Orders> OrdersList;

  _OrderStatusScreenState(this.OrdersList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                right: 8,
                left: 8,
                bottom: 1,
              ),
              child: Container(
                width: double.infinity,
                // height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromRGBO(124, 219, 253, 1),
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'All Orders',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true, // Added this line
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              itemCount: OrdersList.length,
              itemBuilder: (BuildContext context, int index) {
                final orderProduct = OrdersList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: OrderStatusScreenContainer(
                    productsList: orderProduct.orderProducts!,
                    orderID: orderProduct.id!,
                    orderDate: orderProduct.orderDate!,
                    itemName: orderProduct.orderProducts![index].productName!,
                    deliveryDate: DateTime.now(),
                    onPressed: () {
                      pushNewScreen(
                        context,
                        screen: OrderStatusDetailsScreen(
                          Orders_List: OrdersList,
                          index: index,
                        ),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
