part 'productCard.g.dart';

class ProductCardModel {
  String name;
  String category;
  String image;
  double price;
  ProductCardModel(
      {required this.name,
      required this.category,
      required this.image,
      required this.price});

  factory ProductCardModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCardModelToJson(this);
}
