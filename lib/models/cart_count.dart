import 'package:dio/dio.dart' as dio;
import 'dart:core';

class CartData {
  int? status;
  Data? data;

  CartData({this.status, this.data});

  CartData.fromJson(Map<String, dynamic> json) {
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

Future<int> getCount() async {
  var response = await dio.Dio().get(
    "http://msocial-ecommerce.shivinfotechsolution.in/api/v1/cart-count",
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
    int jsonResponse = response.data["data"]["cartCount"];

    return jsonResponse;
  } else {
    throw Exception('Failed to load count');
  }
}

class Data {
  int? cartData;

  Data({this.cartData});

  Data.fromJson(Map<String, dynamic> json) {
    cartData = json['cartData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartData'] = this.cartData;
    return data;
  }
}
