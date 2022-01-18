part of 'wishlist.dart';

_$WishlistModelFromJson(Map<String, dynamic> json) {
  try {
    return WishlistModel(
        name: json['name'] as String,
        image: json['image'] as String,
        price: json['price'] as double,
        category: json['category'] as String,
        isInStock: json['isInStock'] as bool,
        press: json['press'] as GestureTapCallback);
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$WishlistModelToJson(WishlistModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'category': instance.category,
      'isInStock': instance.isInStock,
      'press': instance.press,
    };
