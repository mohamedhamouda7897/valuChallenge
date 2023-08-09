// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
  int? id;
  String? title;
  num? price;
  String? description;

  String? image;
  RatingEntity? rating;

  ProductEntity(
      {this.id,
        this.title,
        this.price,
        this.description,

        this.image,
        this.rating});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,price,description,image,rating];


}

class RatingEntity {
  num? rate;
  int? count;

  RatingEntity({this.rate, this.count});

}
