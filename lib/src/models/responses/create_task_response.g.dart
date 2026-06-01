// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTaskResponse _$CreateTaskResponseFromJson(Map<String, dynamic> json) =>
    CreateTaskResponse(
      errorId: const FlexibleIntConverter().fromJson(json['errorId']),
      taskId: const FlexibleIntConverter().fromJson(json['taskId']),
      errorCode: json['errorCode'] as String?,
      errorDescription: json['errorDescription'] as String?,
    );

Map<String, dynamic> _$CreateTaskResponseToJson(CreateTaskResponse instance) =>
    <String, dynamic>{
      'errorId': const FlexibleIntConverter().toJson(instance.errorId),
      'taskId': _$JsonConverterToJson<dynamic, int>(
        instance.taskId,
        const FlexibleIntConverter().toJson,
      ),
      'errorCode': instance.errorCode,
      'errorDescription': instance.errorDescription,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
