// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String categories;
  String name;
  double price;
  String image;
  DocumentReference? reference;
  String details;
  Food({
    required this.categories,
    required this.name,
    required this.price,
    required this.image,
    this.reference,
    required this.details,
  });

  Food copyWith({
    String? categories,
    String? name,
    double? price,
    String? image,
    DocumentReference? reference,
    String? details,
  }) {
    return Food(
      categories: categories ?? this.categories,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      reference: reference ?? this.reference,
      details: details ?? this.details,
    );
  }

  factory Food.fromSnapShot(DocumentSnapshot documentSnapshot) {
    return Food.fromMap(documentSnapshot.data() as Map<String, dynamic>,
        reference: documentSnapshot.reference);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categories': categories,
      'name': name,
      'price': price,
      'image': image,
      'details': details,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map,
      {DocumentReference? reference}) {
    return Food(
      categories: map['categories'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
      details: map['details'] as String,
      reference: reference,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Food(categories: $categories, name: $name, price: $price, image: $image, details: $details)';
  }

  @override
  bool operator ==(covariant Food other) {
    if (identical(this, other)) return true;

    return other.categories == categories &&
        other.name == name &&
        other.price == price &&
        other.image == image &&
        other.details == details;
  }

  @override
  int get hashCode {
    return categories.hashCode ^
        name.hashCode ^
        price.hashCode ^
        image.hashCode ^
        details.hashCode;
  }
}
