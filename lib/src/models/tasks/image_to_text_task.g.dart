// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_to_text_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageToTextTask _$ImageToTextTaskFromJson(Map<String, dynamic> json) =>
    ImageToTextTask(
      body: json['body'] as String,
      phrase: json['phrase'] as bool?,
      caseSensitive: json['caseSensitive'] as bool?,
      numeric: (json['numeric'] as num?)?.toInt(),
      math: json['math'] as bool?,
      minLength: (json['minLength'] as num?)?.toInt(),
      maxLength: (json['maxLength'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImageToTextTaskToJson(ImageToTextTask instance) =>
    <String, dynamic>{
      'body': instance.body,
      'phrase': instance.phrase,
      'caseSensitive': instance.caseSensitive,
      'numeric': instance.numeric,
      'math': instance.math,
      'minLength': instance.minLength,
      'maxLength': instance.maxLength,
    };
