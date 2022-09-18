// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Order {
  String name;
  String uid;
  String phonenumber;
  String email;
  String? latitude;
  String? longitude;
  String categories;
  String foodname;
  double price;
  String image;
  int count;
  Order({
    required this.name,
    required this.uid,
    required this.phonenumber,
    required this.email,
    this.latitude,
    this.longitude,
    required this.categories,
    required this.foodname,
    required this.price,
    required this.image,
    required this.count,
  });

  Order copyWith({
    String? name,
    String? uid,
    String? phonenumber,
    String? email,
    String? latitude,
    String? longitude,
    String? categories,
    String? foodname,
    double? price,
    String? image,
    int? count,
  }) {
    return Order(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      categories: categories ?? this.categories,
      foodname: foodname ?? this.foodname,
      price: price ?? this.price,
      image: image ?? this.image,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'phonenumber': phonenumber,
      'email': email,
      'latitude': latitude,
      'longitude': longitude,
      'categories': categories,
      'foodname': foodname,
      'price': price,
      'image': image,
      'count': count,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      name: map['name'] as String,
      uid: map['uid'] as String,
      phonenumber: map['phonenumber'] as String,
      email: map['email'] as String,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
      categories: map['categories'] as String,
      foodname: map['foodname'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(name: $name, uid: $uid, phonenumber: $phonenumber, email: $email, latitude: $latitude, longitude: $longitude, categories: $categories, foodname: $foodname, price: $price, image: $image, count: $count)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.uid == uid &&
        other.phonenumber == phonenumber &&
        other.email == email &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.categories == categories &&
        other.foodname == foodname &&
        other.price == price &&
        other.image == image &&
        other.count == count;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        uid.hashCode ^
        phonenumber.hashCode ^
        email.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        categories.hashCode ^
        foodname.hashCode ^
        price.hashCode ^
        image.hashCode ^
        count.hashCode;
  }
}
