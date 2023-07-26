// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  static List<Item>? items;

  Item? getItemById(int id) => items?.firstWhere((element) => element.id == id, orElse: null);

  Item? getItemByPosition(int position) => items?[position];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
  );

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    int? price,
    String? color,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'] as int,
      map['name'] as String,
      map['desc'] as String,
      map['price'] as int,
      map['color'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
