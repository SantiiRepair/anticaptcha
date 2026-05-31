import 'package:json_annotation/json_annotation.dart';
import 'captcha_task.dart';

part 'turnstile_task.g.dart';

@JsonSerializable()
class TurnstileTask extends CaptchaTask {
  final String websiteURL;
  final String websiteKey;
  final String? pageAction;
  final String? pageData;
  final String? userAgent;

  TurnstileTask({
    required this.websiteURL,
    required this.websiteKey,
    this.pageAction,
    this.pageData,
    this.userAgent,
  }) : super(type: 'TurnstileTaskProxyless');

  factory TurnstileTask.fromJson(Map<String, dynamic> json) =>
      _$TurnstileTaskFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TurnstileTaskToJson(this)..['type'] = type;
}
