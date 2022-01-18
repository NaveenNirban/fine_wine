part of 'item.dart';

_$itemFromJson(Map<String, dynamic> json) {
  try {
    return item(
        name: json['name'] as String,
        image: json['image'] as String,
        price: json['price'] as double);
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$itemToJson(item instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
    };
