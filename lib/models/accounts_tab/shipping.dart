part 'shipping.g.dart';

class AccountsShippingModel {
  String addressTypeTitle;
  String addressDescription;
  bool isDefault;
  AccountsShippingModel(
      {required this.addressTypeTitle,
      required this.addressDescription,
      required this.isDefault});

  factory AccountsShippingModel.fromJson(Map<String, dynamic> json) =>
      _$AccountsShippingModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountsShippingModelToJson(this);
}
