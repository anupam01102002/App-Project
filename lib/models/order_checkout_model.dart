import 'package:dio/dio.dart' as dio;
import 'dart:core';

class orderCheckout {
  int? status;
  Data? data;

  orderCheckout({this.status, this.data});

  orderCheckout.fromJson(Map<String, dynamic> json) {
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

Future<List<Data>> getOrdersList() async {
  var response = await dio.Dio().get(
    "http://msocial-ecommerce.shivinfotechsolution.in/api/v1/order-checkout",
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
    List<Data> checkoutList =
        jsonResponse.map((cartJson) => Data.fromJson(cartJson)).toList();
    return checkoutList;
  } else {
    throw Exception('Failed to load items');
  }
}

class Data {
  List<OrderSummeries>? orderSummeries;
  String? deliveryCharge;
  String? taxGstPercentage;
  String? taxGstAmount;
  String? cartAmount;

  Data(
      {this.orderSummeries,
      this.deliveryCharge,
      this.taxGstPercentage,
      this.taxGstAmount,
      this.cartAmount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orderSummeries'] != null) {
      orderSummeries = <OrderSummeries>[];
      json['orderSummeries'].forEach((v) {
        orderSummeries!.add(new OrderSummeries.fromJson(v));
      });
    }
    deliveryCharge = json['deliveryCharge'];
    taxGstPercentage = json['taxGstPercentage'];
    taxGstAmount = json['taxGstAmount'];
    cartAmount = json['cartAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderSummeries != null) {
      data['orderSummeries'] =
          this.orderSummeries!.map((v) => v.toJson()).toList();
    }
    data['deliveryCharge'] = this.deliveryCharge;
    data['taxGstPercentage'] = this.taxGstPercentage;
    data['taxGstAmount'] = this.taxGstAmount;
    data['cartAmount'] = this.cartAmount;
    return data;
  }
}

class OrderSummeries {
  int? id;
  String? qty;
  int? price;
  int? discount;
  String? discountPercentage;
  String? name;
  String? colorName;
  String? sizeName;
  List<String>? images;

  OrderSummeries(
      {this.id,
      this.qty,
      this.price,
      this.discount,
      this.discountPercentage,
      this.name,
      this.colorName,
      this.sizeName,
      this.images});

  OrderSummeries.fromJson(Map<String, dynamic> json) {
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
