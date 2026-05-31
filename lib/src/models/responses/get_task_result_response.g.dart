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
  cost: (json['cost'] as num?)?.toDouble(),
  ip: json['ip'] as String?,
  createTime: (json['createTime'] as num?)?.toInt(),
  endTime: (json['endTime'] as num?)?.toInt(),
  solveCount: (json['solveCount'] as num?)?.toInt(),
  errorCode: json['errorCode'] as String?,
  errorDescription: json['errorDescription'] as String?,
);

Map<String, dynamic> _$GetTaskResultResponseToJson(
  GetTaskResultResponse instance,
) => <String, dynamic>{
  'errorId': instance.errorId,
  'status': instance.status,
  'solution': instance.solution,
  'cost': instance.cost,
  'ip': instance.ip,
  'createTime': instance.createTime,
  'endTime': instance.endTime,
  'solveCount': instance.solveCount,
  'errorCode': instance.errorCode,
  'errorDescription': instance.errorDescription,
};
