part of 'track_order.dart';

_$OrderFromJson(Map<String, dynamic> json) {
  try {
    return Order(
        name: json['name'] as String,
        image: json['image'] as String,
        price: json['price'] as double);
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
    };
