// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTaskResultResponse _$GetTaskResultResponseFromJson(
  Map<String, dynamic> json,
) => GetTaskResultResponse(
  errorId: const FlexibleIntConverter().fromJson(json['errorId']),
  status: json['status'] as String,
  solution: json['solution'] as Map<String, dynamic>?,
  cost: const FlexibleDoubleConverter().fromJson(json['cost']),
  ip: json['ip'] as String?,
  createTime: const FlexibleIntConverter().fromJson(json['createTime']),
  endTime: const FlexibleIntConverter().fromJson(json['endTime']),
  solveCount: const FlexibleIntConverter().fromJson(json['solveCount']),
  errorCode: json['errorCode'] as String?,
  errorDescription: json['errorDescription'] as String?,
);

Map<String, dynamic> _$GetTaskResultResponseToJson(
  GetTaskResultResponse instance,
) => <String, dynamic>{
  'errorId': const FlexibleIntConverter().toJson(instance.errorId),
  'status': instance.status,
  'solution': instance.solution,
  'cost': const FlexibleDoubleConverter().toJson(instance.cost),
  'ip': instance.ip,
  'createTime': _$JsonConverterToJson<dynamic, int>(
    instance.createTime,
    const FlexibleIntConverter().toJson,
  ),
  'endTime': _$JsonConverterToJson<dynamic, int>(
    instance.endTime,
    const FlexibleIntConverter().toJson,
  ),
  'solveCount': _$JsonConverterToJson<dynamic, int>(
    instance.solveCount,
    const FlexibleIntConverter().toJson,
  ),
  'errorCode': instance.errorCode,
  'errorDescription': instance.errorDescription,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
