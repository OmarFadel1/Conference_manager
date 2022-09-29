import 'package:flutter/material.dart';

class sold_product {
  String id;
  final String name;
  final int quantity;
  final double price;
  final String soldby;

  sold_product({
    this.id = '',
    required this.name,
    required this.quantity,
    required this.price,
    required this.soldby,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'price': price,
        'soldby': soldby,
      };

  static sold_product fromJson(Map<String, dynamic> json) => sold_product(
        name: json['name'],
        quantity: json['quantity'],
        price: json['price'],
        soldby: json['soldby'],
      );
}
