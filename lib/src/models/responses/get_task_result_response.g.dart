// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTaskResultResponse _$GetTaskResultResponseFromJson(
  Map<String, dynamic> json,
) => GetTaskResultResponse(
  errorId: (json['errorId'] as num).toInt(),
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
  'errorId': instance.errorId,
  'status': instance.status,
  'solution': instance.solution,
  'cost': const FlexibleDoubleConverter().toJson(instance.cost),
  'ip': instance.ip,
  'createTime': const FlexibleIntConverter().toJson(instance.createTime),
  'endTime': const FlexibleIntConverter().toJson(instance.endTime),
  'solveCount': const FlexibleIntConverter().toJson(instance.solveCount),
  'errorCode': instance.errorCode,
  'errorDescription': instance.errorDescription,
};
