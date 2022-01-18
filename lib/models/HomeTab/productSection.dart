import 'productCard.dart';

part 'productSection.g.dart';

class ProductSectionModel {
  String sectionTitle;
  List<ProductCardModel> products;
  ProductSectionModel({required this.sectionTitle, required this.products});

  factory ProductSectionModel.fromJson(Map<String, dynamic> json) =>
      _$ProductSectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSectionModelToJson(this);
}
