part of 'categorySectionModel.dart';

_$CategorySectionModelFromJson(Map<String, dynamic> json) {
  try {
    return CategorySectionModel(
      title: json['name'] as String,
      categories: json['categories'] as List<CategoryModel>,
    );
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$CategorySectionModelToJson(
        CategorySectionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'categories': instance.categories,
    };
