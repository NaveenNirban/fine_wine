part of 'viewOrder.dart';

_$ViewOrderFromJson(Map<String, dynamic> json) {
  try {
    return ViewOrder(
        date: json['date'] as String,
        time: json['time'] as String,
        stateName: json['stateName'] as String,
        location: json['location'] as String,
        isOnPresentState: json['isOnPresentState'] as bool,
        isProcessed: json['isProcessed'] as bool,
        isComplete: json['isComplete'] as bool);
  } catch (e, stacktrace) {
    print('Error at item Model to home :: ${e.toString()} \n');
    print("=========================================================\n");
    print("STACKTRACE :: ${stacktrace.toString()}");
  }
}

Map<String, dynamic> _$ViewOrderToJson(ViewOrder instance) => <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'stateName': instance.stateName,
      'location': instance.location,
      'isOnPresentState': instance.isOnPresentState,
      'isProcessed': instance.isProcessed,
      'isComplete': instance.isComplete
    };
