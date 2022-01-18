part of 'shipping.dart';

_$AccountsShippingModelFromJson(Map<String, dynamic> json) {
  try {
    return AccountsShippingModel(
        addressTypeTitle: json['addressTypeTitle'] as String,
        addressDescription: json['addressDescription'] as String,
        isDefault: json['isDefault'] as bool);
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$AccountsShippingModelToJson(
        AccountsShippingModel instance) =>
    <String, dynamic>{
      'addressTypeTitle': instance.addressTypeTitle,
      'addressDescription': instance.addressDescription,
      'isDefault': instance.isDefault,
    };
