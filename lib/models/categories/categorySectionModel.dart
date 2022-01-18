import 'categoryModel.dart';

part 'categorySectionModel.g.dart';

class CategorySectionModel {
  String title;
  List<CategoryModel> categories;
  CategorySectionModel({required this.title, required this.categories});

  factory CategorySectionModel.fromJson(Map<String, dynamic> json) =>
      _$CategorySectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategorySectionModelToJson(this);
}
