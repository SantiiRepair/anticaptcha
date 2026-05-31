// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turnstile_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurnstileTask _$TurnstileTaskFromJson(Map<String, dynamic> json) =>
    TurnstileTask(
      websiteURL: json['websiteURL'] as String,
      websiteKey: json['websiteKey'] as String,
      pageAction: json['pageAction'] as String?,
      pageData: json['pageData'] as String?,
      userAgent: json['userAgent'] as String?,
    );

Map<String, dynamic> _$TurnstileTaskToJson(TurnstileTask instance) =>
    <String, dynamic>{
      'websiteURL': instance.websiteURL,
      'websiteKey': instance.websiteKey,
      'pageAction': instance.pageAction,
      'pageData': instance.pageData,
      'userAgent': instance.userAgent,
    };
