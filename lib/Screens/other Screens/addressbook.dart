import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/addressContainer.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_1.dart';
import 'package:mothering_app/CustomWidgets/app_drawer/motheringAppBarDrawer.dart';
import 'package:mothering_app/Screens/other%20Screens/addnewaddress_screen.dart';
import 'package:mothering_app/models/Address_model.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class AddressbookScreen extends StatefulWidget {
  final List<Addresses> addresses;

  const AddressbookScreen({
    super.key,
    required this.addresses,
  });
  @override
  State<AddressbookScreen> createState() => _AddressbookScreenState(addresses);
}

class _AddressbookScreenState extends State<AddressbookScreen> {
  final List<Addresses> addresses;

  _AddressbookScreenState(this.addresses);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MotheringAppBar_1(),
      drawer: MotheringAppBarDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              itemCount: addresses.length,
              itemBuilder: (BuildContext context, int index) {
                final address =
                    addresses[index]; // Get the current Addresses object
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AddressContainer(
                    tagName: 'tagName',
                    userName: address.name!,
                    blockNo: address.address!,
                    pincode: address.pincode!,
                    cityName: address.city!,
                    landmarkName: address.landmark!,
                    streetAddress: address.address1!,
                    phoneNumber: address.mobile!,
                    id: address.id!,
                    type: int.parse(address.type!),
                    state: address.state!,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              right: 8,
              left: 8,
              bottom: 8,
            ),
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(196, 196, 196, 1),
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        pushNewScreen(
                          context,
                          screen: NewAddress(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                          Text(
                            'Add new Address',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressTagContainer extends StatelessWidget {
  final String tagName;

  AddressTagContainer({
    required this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
          child: Text(
            tagName,
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
