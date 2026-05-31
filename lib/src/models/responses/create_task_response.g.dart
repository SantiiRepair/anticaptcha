// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTaskResponse _$CreateTaskResponseFromJson(Map<String, dynamic> json) =>
    CreateTaskResponse(
      errorId: (json['errorId'] as num).toInt(),
      taskId: (json['taskId'] as num?)?.toInt(),
      errorCode: json['errorCode'] as String?,
      errorDescription: json['errorDescription'] as String?,
    );

Map<String, dynamic> _$CreateTaskResponseToJson(CreateTaskResponse instance) =>
    <String, dynamic>{
      'errorId': instance.errorId,
      'taskId': instance.taskId,
      'errorCode': instance.errorCode,
      'errorDescription': instance.errorDescription,
    };
