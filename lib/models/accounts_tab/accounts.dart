part 'accounts.g.dart';

class AccountsTabModel {
  String image;
  String title;
  String route;
  AccountsTabModel(
      {required this.image, required this.title, required this.route});

  factory AccountsTabModel.fromJson(Map<String, dynamic> json) =>
      _$AccountsTabModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountsTabModelToJson(this);
}
