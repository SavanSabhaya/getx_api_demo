// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:get/state_manager.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageLink,
    required this.rating,
  });

  int id;
  String name;
  String price;
  String imageLink;
  double? rating;

  var isFavorite = false.obs;
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        imageLink: json["image_link"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image_link": imageLink,
        "rating": rating == null ? null : rating,
      };
}
