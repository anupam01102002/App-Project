import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/deliveryLocationModalScreen.dart';

class DeliveryLocationContainer extends StatelessWidget {
  const DeliveryLocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        height: 40,
        width: double.infinity,
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Color.fromRGBO(150, 150, 150, 1),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Deliver to 365420',
                    style: TextStyle(
                      color: Color.fromRGBO(150, 150, 150, 1),
                    ),
                  ),
                ],
              ),
              ModalDeliveryLocation(
                playAreaName: 'playAreaName',
                playAreaLocation: 'playAreaLocation',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
