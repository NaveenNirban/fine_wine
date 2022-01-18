part of 'accounts.dart';

_$AccountsTabModelFromJson(Map<String, dynamic> json) {
  try {
    return AccountsTabModel(
        title: json['title'] as String,
        image: json['image'] as String,
        route: json['route'] as String);
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$AccountsTabModelToJson(AccountsTabModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'route': instance.route,
    };
