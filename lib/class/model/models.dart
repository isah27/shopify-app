import 'dart:convert';

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.gender,
    this.address,
    this.bankNames,
    this.accountNames,
    this.accountNumbers,
    this.accountTypes,
    required this.password,
  });
  User.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    username = map["username"];
    email = map["email"];
    phoneNumber = map["phone_number"];
    gender = map["gender"];
    address = map["address"];
    bankNames = map["bank_names"];
    accountNames = map["account_names"];
    accountNumbers = map["account_numbers"];
    accountTypes = map["account_types"];
    password = map["password"];
  }

  int? id;
  String? username;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? bankNames;
  String? accountNames;
  String? accountNumbers;
  String? accountTypes;
  String? password;
  Map<String, dynamic> tomap() {
    var map = <String, dynamic>{
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "gender": gender,
      "address": address,
      "bank_names": bankNames,
      "account_names": accountNames,
      "account_numbers": accountNumbers,
      "account_types": accountTypes,
      "password": password,
    };
    if (id != null) map["id"] = id;
    return map;
  }
}

class Cart {
  Cart({
    this.id,
    this.customer,
    this.vendorId,
    this.productId,
    this.name,
    this.price,
    this.category,
    this.rating,
    this.image,
  });
  int? id;
  int? customer;
  int? vendorId;
  int? productId;
  String? name;
  int? price;
  String? category;
  int? rating;
  String? image;

  Cart.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    customer = map["customer"];
    vendorId = map["vendor_id"];
    productId = map["product_id"];
    name = map["name"];
    price = map["price"];
    category = map["category"];
    rating = map["rating"];
    image = map["image"];
  }

  Map<String, dynamic> toMap() {
    var map = {
      "customer": customer,
      "vendor_id": vendorId,
      "product_id": productId,
      "name": name,
      "price": price,
      "category": category,
      "rating": rating,
      "image": image,
    };
    if (id != null) map["id"] = id;
    return map;
  }
}

class Order {
  Order({
    this.id,
    this.customer,
    this.productId,
    this.vendorId,
    this.productName,
    this.quantity,
    this.price,
    this.orderStatus,
  });
  int? id;
  int? customer;
  int? productId;
  int? vendorId;
  String? productName;
  int? quantity;
  int? price;
  String? orderStatus;
  Order.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    customer = map["customer"];
    productId = map["product_id"];
    vendorId = map["vendor_id"];
    productName = map["product_name"];
    quantity = map["quantity"];
    price = map["price"];
    orderStatus = map["order_status"];
  }

  Map<String, dynamic> toMap() {
    var map = {
      "customer": customer,
      "product_id": productId,
      "vendor_id": vendorId,
      "product_name": productName,
      "quantity": quantity,
      "price": price,
      "order_status": orderStatus,
    };
    if (id != null) map["id"] = id;
    return map;
  }
}





Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.id,
        this.vendor,
        this.name,
        this.description,
        this.price,
        this.category,
        this.image,
    });

    int? id;
    int? vendor;
    String? name;
    String? description;
    String? price;
    int? category;
    String? image;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        vendor: json["vendor"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor": vendor,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "image": image,
    };
}
