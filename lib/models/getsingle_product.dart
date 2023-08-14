class GetSingleProductModel {
  int? status;
  Data? data;

  GetSingleProductModel({this.status, this.data});

  GetSingleProductModel.fromJson(Map<String, dynamic> json) {
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
  Product? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? variationId;
  String? productId;
  int? categoryId;
  String? colorId;
  String? sizeId;
  String? name;
  String? description;
  String? categoryName;
  String? sizeName;
  String? colorName;
  int? price;
  String? qty;
  int? discount;
  String? discountPercentage;
  String? chartImage;
  List<String>? images;

  Product(
      {this.variationId,
      this.productId,
      this.categoryId,
      this.colorId,
      this.sizeId,
      this.name,
      this.description,
      this.categoryName,
      this.sizeName,
      this.colorName,
      this.price,
      this.qty,
      this.discount,
      this.discountPercentage,
      this.chartImage,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    variationId = json['variationId'];
    productId = json['productId'];
    categoryId = json['categoryId'];
    colorId = json['colorId'];
    sizeId = json['sizeId'];
    name = json['name'];
    description = json['description'];
    categoryName = json['categoryName'];
    sizeName = json['sizeName'];
    colorName = json['colorName'];
    price = json['price'];
    qty = json['qty'];
    discount = json['discount'];
    discountPercentage = json['discountPercentage'];
    chartImage = json['chartImage'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variationId'] = this.variationId;
    data['productId'] = this.productId;
    data['categoryId'] = this.categoryId;
    data['colorId'] = this.colorId;
    data['sizeId'] = this.sizeId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['categoryName'] = this.categoryName;
    data['sizeName'] = this.sizeName;
    data['colorName'] = this.colorName;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['discount'] = this.discount;
    data['discountPercentage'] = this.discountPercentage;
    data['chartImage'] = this.chartImage;
    data['images'] = this.images;
    return data;
  }
}
