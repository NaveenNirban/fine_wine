part of 'categoryModel.dart';

_$CategoryModelFromJson(Map<String, dynamic> json) {
  try {
    return CategoryModel(
      name: json['name'] as String,
      image: json['image'] as String,
    );
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'title': instance.name,
      'image': instance.image,
    };
