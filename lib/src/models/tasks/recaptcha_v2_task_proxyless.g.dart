// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recaptcha_v2_task_proxyless.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecaptchaV2TaskProxyless _$RecaptchaV2TaskProxylessFromJson(
  Map<String, dynamic> json,
) => RecaptchaV2TaskProxyless(
  websiteURL: json['websiteURL'] as String,
  websiteKey: json['websiteKey'] as String,
  websiteSToken: json['websiteSToken'] as String?,
  recaptchaDataSValue: json['recaptchaDataSValue'] as String?,
  isInvisible: json['isInvisible'] as bool?,
);

Map<String, dynamic> _$RecaptchaV2TaskProxylessToJson(
  RecaptchaV2TaskProxyless instance,
) => <String, dynamic>{
  'websiteURL': instance.websiteURL,
  'websiteKey': instance.websiteKey,
  'websiteSToken': instance.websiteSToken,
  'recaptchaDataSValue': instance.recaptchaDataSValue,
  'isInvisible': instance.isInvisible,
};
