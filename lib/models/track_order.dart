part 'track_order.g.dart';

class Order {
  String name, image;
  double price;

  Order({required this.name, required this.image, required this.price});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
