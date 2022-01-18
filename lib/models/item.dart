part 'item.g.dart';

class item {
  String image;
  double price;
  String name;
  item({required this.name, required this.image, required this.price});

  factory item.fromJson(Map<String, dynamic> json) => _$itemFromJson(json);

  Map<String, dynamic> toJson() => _$itemToJson(this);
}
