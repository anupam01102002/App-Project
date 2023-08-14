class ProductModel {
  int? status;
  Data? data;

  ProductModel({this.status, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
  List<Products>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? variationId;
  String? productId;
  String? colorId;
  String? sizeId;
  String? name;
  int? price;
  String? qty;
  int? discount;
  String? discountPercentage;
  List<String>? images;

  Products(
      {this.variationId,
      this.productId,
      this.colorId,
      this.sizeId,
      this.name,
      this.price,
      this.qty,
      this.discount,
      this.discountPercentage,
      this.images});

  Products.fromJson(Map<String, dynamic> json) {
    variationId = json['variationId'];
    productId = json['productId'];
    colorId = json['colorId'];
    sizeId = json['sizeId'];
    name = json['name'];
    price = json['price'];
    qty = json['qty'];
    discount = json['discount'];
    discountPercentage = json['discountPercentage'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variationId'] = this.variationId;
    data['productId'] = this.productId;
    data['colorId'] = this.colorId;
    data['sizeId'] = this.sizeId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['discount'] = this.discount;
    data['discountPercentage'] = this.discountPercentage;
    data['images'] = this.images;
    return data;
  }
}
