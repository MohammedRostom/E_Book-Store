import 'package:flutter/material.dart';

class BookItem {
  int? id;
  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;

  BookItem({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory BookItem.fromJson(Map<String, dynamic> json) => BookItem(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": int.parse(isbn13),
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
      };
}
