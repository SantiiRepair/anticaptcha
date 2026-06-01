// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turnstile_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurnstileTask _$TurnstileTaskFromJson(Map<String, dynamic> json) =>
    TurnstileTask(
      websiteURL: json['websiteURL'] as String,
      websiteKey: json['websiteKey'] as String,
      proxyType: json['proxyType'] as String,
      proxyAddress: json['proxyAddress'] as String,
      proxyPort: const FlexibleIntConverter().fromJson(json['proxyPort']),
      proxyLogin: json['proxyLogin'] as String?,
      proxyPassword: json['proxyPassword'] as String?,
      action: json['action'] as String?,
      cData: json['cData'] as String?,
      chlPageData: json['chlPageData'] as String?,
      userAgent: json['userAgent'] as String?,
      cookies: json['cookies'] as String?,
      isInvisible: json['isInvisible'] as bool?,
    );

Map<String, dynamic> _$TurnstileTaskToJson(TurnstileTask instance) =>
    <String, dynamic>{
      'websiteURL': instance.websiteURL,
      'websiteKey': instance.websiteKey,
      'action': instance.action,
      'cData': instance.cData,
      'chlPageData': instance.chlPageData,
      'proxyType': instance.proxyType,
      'proxyAddress': instance.proxyAddress,
      'proxyPort': const FlexibleIntConverter().toJson(instance.proxyPort),
      'proxyLogin': instance.proxyLogin,
      'proxyPassword': instance.proxyPassword,
      'userAgent': instance.userAgent,
      'cookies': instance.cookies,
      'isInvisible': instance.isInvisible,
    };
