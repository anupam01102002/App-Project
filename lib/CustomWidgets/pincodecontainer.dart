import 'package:flutter/material.dart';

class PincodeContainer extends StatelessWidget {
  final int pincode;

  const PincodeContainer({
    required this.pincode,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            0.05,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    color: Color.fromRGBO(150, 150, 150, 1),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Deliver to ',
                    style: TextStyle(
                      color: Color.fromRGBO(150, 150, 150, 1),
                    ),
                  ),
                  Text('$pincode')
                ],
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromRGBO(150, 150, 150, 1),
                ),
                onPressed: () {
                  // Add your logic for handling dropdown button press
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
