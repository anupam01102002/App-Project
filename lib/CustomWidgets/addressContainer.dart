import 'package:flutter/material.dart';

class AddressContainer extends StatelessWidget {
  final String? tagName;
  final String userName;
  final String blockNo;
  final int pincode;
  final String cityName;
  final String landmarkName;
  final String streetAddress;
  final int phoneNumber;

  AddressContainer({
    required this.tagName,
    required this.userName,
    required this.blockNo,
    required this.pincode,
    required this.cityName,
    required this.landmarkName,
    required this.streetAddress,
    required this.phoneNumber,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
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
                      AddressTagContainer(tagName: tagName),
                      AddressDetailsContainer(
                        userName: userName,
                        blockNo: blockNo,
                        pincode: '$pincode',
                        cityName: cityName,
                        landmarkName: landmarkName,
                        streetAddress: streetAddress,
                        phoneNumber: '$phoneNumber',
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Delete_Button(),
                      SizedBox(
                        width: 12,
                      ),
                      Edit_Button(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressTagContainer extends StatelessWidget {
  final String? tagName;

  AddressTagContainer({
    required this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
          child: Text(
            '$tagName',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class AddressDetailsContainer extends StatelessWidget {
  final String userName;
  final String blockNo;
  final String pincode;
  final String cityName;
  final String landmarkName;
  final String streetAddress;
  final String phoneNumber;

  AddressDetailsContainer({
    required this.userName,
    required this.blockNo,
    required this.pincode,
    required this.cityName,
    required this.landmarkName,
    required this.streetAddress,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              phoneNumber,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              blockNo,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              streetAddress,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              landmarkName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              cityName + ' - ' + pincode,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class Delete_Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
          color: Color.fromRGBO(170, 0, 0, 1),
          iconSize: 15,
        ),
      ),
    );
  }
}

class Edit_Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit_square),
          color: Color.fromRGBO(3, 106, 181, 1),
          iconSize: 15,
        ),
      ),
    );
  }
}
