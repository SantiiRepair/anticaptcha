// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turnstile_task_proxyless.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurnstileTaskProxyless _$TurnstileTaskProxylessFromJson(
  Map<String, dynamic> json,
) => TurnstileTaskProxyless(
  websiteURL: json['websiteURL'] as String,
  websiteKey: json['websiteKey'] as String,
  action: json['action'] as String?,
  cData: json['cData'] as String?,
  chlPageData: json['chlPageData'] as String?,
);

Map<String, dynamic> _$TurnstileTaskProxylessToJson(
  TurnstileTaskProxyless instance,
) => <String, dynamic>{
  'websiteURL': instance.websiteURL,
  'websiteKey': instance.websiteKey,
  'action': instance.action,
  'cData': instance.cData,
  'chlPageData': instance.chlPageData,
};
