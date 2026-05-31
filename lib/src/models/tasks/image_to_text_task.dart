import 'package:json_annotation/json_annotation.dart';
import 'captcha_task.dart';

part 'image_to_text_task.g.dart';

@JsonSerializable(createToJson: true)
class ImageToTextTask extends CaptchaTask {
  final String body;
  final bool? phrase;
  final bool? caseSensitive;
  final int? numeric;
  final bool? math;
  final int? minLength;
  final int? maxLength;

  ImageToTextTask({
    required this.body,
    this.phrase,
    this.caseSensitive,
    this.numeric,
    this.math,
    this.minLength,
    this.maxLength,
  }) : super(type: 'ImageToTextTask');

  factory ImageToTextTask.fromJson(Map<String, dynamic> json) =>
      _$ImageToTextTaskFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageToTextTaskToJson(this)..['type'] = type;
}
