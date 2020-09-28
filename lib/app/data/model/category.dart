import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ispot/app/data/model/attribute.dart';
import 'package:ispot/app/data/model/product.dart';

class CategoryModel {
  String categoryName;
  String categoryId;
  String categoryImageUrl;
  List<Attribute> attributes;
  List<Product> products;

  CategoryModel({
    this.categoryName,
    this.categoryId,
    this.categoryImageUrl,
    this.attributes,
    this.products,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryModel &&
        o.categoryName == categoryName &&
        o.categoryId == categoryId &&
        o.categoryImageUrl == categoryImageUrl &&
        listEquals(o.attributes, attributes) &&
        listEquals(o.products, products);
  }

  @override
  int get hashCode {
    return categoryName.hashCode ^
        categoryId.hashCode ^
        categoryImageUrl.hashCode ^
        attributes.hashCode ^
        products.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'categoryId': categoryId,
      'categoryImageUrl': categoryImageUrl,
      'attributes': attributes?.map((x) => x?.toMap())?.toList(),
      'products': products?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoryModel(
      categoryName: map['categoryName'],
      categoryId: map['categoryId'],
      categoryImageUrl: map['categoryImageUrl'],
      attributes: List<Attribute>.from(
          map['attributes']?.map((x) => Attribute.fromMap(x))),
      products:
          List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  CategoryModel copyWith({
    String categoryName,
    String categoryId,
    String categoryImageUrl,
    List<Attribute> attributes,
    List<Product> products,
  }) {
    return CategoryModel(
      categoryName: categoryName ?? this.categoryName,
      categoryId: categoryId ?? this.categoryId,
      categoryImageUrl: categoryImageUrl ?? this.categoryImageUrl,
      attributes: attributes ?? this.attributes,
      products: products ?? this.products,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(categoryName: $categoryName, categoryId: $categoryId, categoryImageUrl: $categoryImageUrl, attributes: $attributes, products: $products)';
  }
}
