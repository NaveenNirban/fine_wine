part of 'productCard.dart';

_$ProductCardModelFromJson(Map<String, dynamic> json) {
  try {
    return ProductCardModel(
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'] as double,
      category: json['category'] as String,
    );
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$ProductCardModelToJson(ProductCardModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'price': instance.price,
      'name': instance.name,
      'category': instance.category
    };
