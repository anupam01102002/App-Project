// import 'dart:convert';
// import 'dart:ffi';
import 'package:dio/dio.dart' as dio;
import 'dart:core';

class GetAddress {
  int? status;
  Data? data;

  GetAddress({
    this.status,
    this.data,
  });

  GetAddress.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Addresses>? addresses;

  Data({this.addresses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

Future<List<Addresses>> getAddress() async {
  var response = await dio.Dio().get(
    "http://msocial-ecommerce.shivinfotechsolution.in/api/v1/addresses",
    options: dio.Options(
      headers: {
        "Content-Type": "application/json",
        "Accept": "*/*",
        "Authorization":
            "eyJpdiI6ImdtSHgxRUlrdXBUZ0RHSTRVZGdnUEE9PSIsInZhbHVlIjoicForQ0xRbzhzaG0vVlVPbHM5cTVETkdJSFBBNjEzQnNaaHAxV2JDUmpMR0w0WVgybnRlZ2lhTENwM0JGZWorQVF1WjU5dWNqUHFvRG9UcFk4ZThpSXc9PSIsIm1hYyI6ImNhOGIwZDJjOWIzYjI5MjRkYzY3YTMxOGEyYTQxMDU2YzY5YjFjY2FjNWUwNmE0NjU0OGExZjc5MmE5NDJkODQiLCJ0YWciOiIifQ",
      },
    ),
  );
  if (response.statusCode == 200) {
    // print(response.data["data"]);
    List<dynamic> jsonResponse = response.data["data"]["addresses"];
    // print(jsonResponse[0]);
    List<Addresses> addressesList = jsonResponse
        .map((addressJson) => Addresses.fromJson(addressJson))
        .toList();
    return addressesList;
  } else {
    throw Exception('Failed to load addresses');
  }
}

class Addresses {
  int? id;
  String? name;
  String? mobile;
  String? address;
  String? address1;
  String? city;
  String? state;
  int? pincode;
  String? landmark;
  String? type;

  Addresses({
    this.id,
    this.name,
    this.mobile,
    this.address,
    this.address1,
    this.city,
    this.state,
    this.pincode,
    this.landmark,
    this.type,
  });

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    address1 = json['address_1'];
    city = json['city'];
    state = json['state'];
    pincode = int.tryParse(json['pincode']);
    landmark = json['landmark'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['address_1'] = this.address1;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['landmark'] = this.landmark;
    data['type'] = this.type;
    return data;
  }
}
