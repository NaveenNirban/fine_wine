part of 'productSection.dart';

_$ProductSectionModelFromJson(Map<String, dynamic> json) {
  try {
    return ProductSectionModel(
      sectionTitle: json['sectionTitle'] as String,
      products: json['products'] as List<ProductCardModel>,
    );
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$ProductSectionModelToJson(
        ProductSectionModel instance) =>
    <String, dynamic>{
      'sectionTitle': instance.sectionTitle,
      'products': instance.products,
    };
