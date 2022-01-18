import 'package:flutter/cupertino.dart';

part 'wishlist.g.dart';

class WishlistModel {
  String name;
  String category;
  double price;
  String image;
  bool isInStock;
  GestureTapCallback press;
  WishlistModel(
      {required this.name,
      required this.category,
      required this.image,
      required this.price,
      required this.isInStock,
      required this.press});

  factory WishlistModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistModelToJson(this);
}
