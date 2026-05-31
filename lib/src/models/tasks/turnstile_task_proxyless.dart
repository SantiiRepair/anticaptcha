import 'package:json_annotation/json_annotation.dart';
import 'captcha_task.dart';

part 'turnstile_task_proxyless.g.dart';

@JsonSerializable()
class TurnstileTaskProxyless extends CaptchaTask {
  final String websiteURL;
  final String websiteKey;
  final String? action;
  final String? cData;
  final String? chlPageData;

  TurnstileTaskProxyless({
    required this.websiteURL,
    required this.websiteKey,
    this.action,
    this.cData,
    this.chlPageData,
  }) : super(type: 'TurnstileTaskProxyless');

  factory TurnstileTaskProxyless.fromJson(Map<String, dynamic> json) =>
      _$TurnstileTaskProxylessFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$TurnstileTaskProxylessToJson(this)..['type'] = type;
}
