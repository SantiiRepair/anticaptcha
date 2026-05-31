// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recaptcha_v2_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecaptchaV2Task _$RecaptchaV2TaskFromJson(Map<String, dynamic> json) =>
    RecaptchaV2Task(
      websiteURL: json['websiteURL'] as String,
      websiteKey: json['websiteKey'] as String,
      websiteSToken: json['websiteSToken'] as String?,
      recaptchaDataSValue: json['recaptchaDataSValue'] as String?,
      isInvisible: json['isInvisible'] as bool? ?? false,
    );

Map<String, dynamic> _$RecaptchaV2TaskToJson(RecaptchaV2Task instance) =>
    <String, dynamic>{
      'websiteURL': instance.websiteURL,
      'websiteKey': instance.websiteKey,
      'websiteSToken': instance.websiteSToken,
      'recaptchaDataSValue': instance.recaptchaDataSValue,
      'isInvisible': instance.isInvisible,
    };
