import 'package:dio/dio.dart' as dio;
import 'dart:core';

class CartList {
  int? status;
  Data? data;

  CartList({this.status, this.data});

  CartList.fromJson(Map<String, dynamic> json) {
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
  List<Carts>? carts;

  Data({this.carts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carts != null) {
      data['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

Future<List<Carts>> getCartList() async {
  var response = await dio.Dio().get(
    "http://msocial-ecommerce.shivinfotechsolution.in/api/v1/carts",
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
    print(response.data["data"]);
    List<dynamic> jsonResponse = response.data["data"]["carts"];
    print(jsonResponse[0]);
    List<Carts> cartList =
        jsonResponse.map((cartJson) => Carts.fromJson(cartJson)).toList();
    return cartList;
  } else {
    throw Exception('Failed to load cart items');
  }
}

class Carts {
  int? id;
  String? qty;
  int? price;
  int? discount;
  String? discountPercentage;
  String? name;
  String? colorName;
  String? sizeName;
  List<String>? images;

  Carts(
      {this.id,
      this.qty,
      this.price,
      this.discount,
      this.discountPercentage,
      this.name,
      this.colorName,
      this.sizeName,
      this.images});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qty = json['qty'];
    price = json['price'];
    discount = json['discount'];
    discountPercentage = json['discountPercentage'];
    name = json['name'];
    colorName = json['colorName'];
    sizeName = json['sizeName'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['discountPercentage'] = this.discountPercentage;
    data['name'] = this.name;
    data['colorName'] = this.colorName;
    data['sizeName'] = this.sizeName;
    data['images'] = this.images;
    return data;
  }
}
