// ignore_for_file: must_be_immutable

import 'package:valu_challenge/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  String? category;

  ProductModel(
      {super.id,
      super.title,
      super.price,
      super.description,
      this.category,
      super.image,
      super.rating});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
}

class Rating extends RatingEntity {
  Rating({super.rate, super.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
