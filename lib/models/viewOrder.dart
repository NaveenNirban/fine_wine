part 'viewOrder.g.dart';

class ViewOrder {
  String date;
  String time;
  String stateName;
  String location;
  bool isProcessed;
  bool isOnPresentState;
  bool isComplete;
  ViewOrder(
      {required this.date,
      required this.isOnPresentState,
      required this.isProcessed,
      required this.location,
      required this.stateName,
      required this.time,
      required this.isComplete});

  factory ViewOrder.fromJson(Map<String, dynamic> json) =>
      _$ViewOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ViewOrderToJson(this);
}
