import 'package:flutter/material.dart';
import 'package:mothering_app/Screens/other%20Screens/editAddressScreen.dart';
// import 'package:mothering_app/models/Address.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'package:mothering_app/Screens/other%20Screens/addressbook.dart';
import 'dart:convert';
import 'package:mothering_app/models/Address_model.dart';
import 'package:mothering_app/models/addres_delete_model.dart';

class AddressContainer extends StatefulWidget {
  final String? tagName;
  final String userName;
  final int id;
  final String blockNo;
  final int pincode;
  final String cityName;
  final String landmarkName;
  final String streetAddress;
  final String phoneNumber;
  final String state;
  final int type;

  AddressContainer({
    required this.tagName,
    required this.id,
    required this.userName,
    required this.blockNo,
    required this.pincode,
    required this.cityName,
    required this.landmarkName,
    required this.streetAddress,
    required this.phoneNumber,
    required this.type,
    required this.state,
  });

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  Future<void> postRequest(
    int id,
  ) async {
    var url =
        'http://msocial-ecommerce.shivinfotechsolution.in/api/v1/address/delete';
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
        var deleteResponse = DeleteAddress.fromJson(jsonObject);

        if (deleteResponse.status == 200) {
          var addresses = await getAddress();
          // Successful Address Deletion

          Future.delayed(Duration.zero, () {
            pushNewScreen(
              context,
              screen: AddressbookScreen(
                addresses: addresses,
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
                      AddressTagContainer(tagName: widget.tagName),
                      AddressDetailsContainer(
                        userName: widget.userName,
                        blockNo: widget.blockNo,
                        pincode: '${widget.pincode}',
                        cityName: widget.cityName,
                        landmarkName: widget.landmarkName,
                        streetAddress: widget.streetAddress,
                        phoneNumber: '${widget.phoneNumber}',
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Delete_Button(
                        onTap: onTapDeleteAddress,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Edit_Button(
                        tagName: widget.tagName!,
                        userName: widget.userName,
                        blockNo: widget.blockNo,
                        pincode: widget.pincode,
                        cityName: widget.cityName,
                        landmarkName: widget.landmarkName,
                        streetAddress: widget.streetAddress,
                        phoneNumber: widget.phoneNumber,
                        type: widget.type,
                        id: widget.id,
                        state: widget.state,
                      ),
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

  onTapDeleteAddress() {
    FocusManager.instance.primaryFocus?.unfocus();

    postRequest(
      widget.id,
    );
    // Timer(const Duration(seconds: 3), () {

    // });
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
  final VoidCallback onTap;

  Delete_Button({required this.onTap});

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
          onPressed: onTap,
          icon: Icon(Icons.delete),
          color: Color.fromRGBO(170, 0, 0, 1),
          iconSize: 15,
        ),
      ),
    );
  }
}

class Edit_Button extends StatelessWidget {
  final String tagName;
  final String userName;
  final String blockNo;
  final int pincode;
  final String cityName;
  final String landmarkName;
  final String streetAddress;
  final String phoneNumber;
  final String state;
  final int type;
  final int id;

  Edit_Button({
    required this.tagName,
    required this.userName,
    required this.blockNo,
    required this.pincode,
    required this.state,
    required this.cityName,
    required this.landmarkName,
    required this.streetAddress,
    required this.phoneNumber,
    required this.type,
    required this.id,
  });

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
          onPressed: () {
            pushNewScreen(
              context,
              screen: EditAddress(
                state: state,
                tagName: tagName,
                userName: userName,
                blockNo: blockNo,
                pincode: pincode,
                cityName: cityName,
                landmarkName: landmarkName,
                streetAddress: streetAddress,
                phoneNumber: phoneNumber,
                type: type,
                id: id,
              ),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          icon: Icon(Icons.edit_square),
          color: Color.fromRGBO(3, 106, 181, 1),
          iconSize: 15,
        ),
      ),
    );
  }
}
