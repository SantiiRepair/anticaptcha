import 'package:json_annotation/json_annotation.dart';
import 'captcha_task.dart';

part 'turnstile_task.g.dart';

@JsonSerializable()
class TurnstileTask extends CaptchaTask {
  final String websiteURL;
  final String websiteKey;
  final String? action;
  final String? cData;
  final String? chlPageData;
  
  // Proxy parameters
  final String proxyType;
  final String proxyAddress;
  final int proxyPort;
  final String? proxyLogin;
  final String? proxyPassword;
  final String? userAgent;
  final String? cookies;
  final bool? isInvisible;

  TurnstileTask({
    required this.websiteURL,
    required this.websiteKey,
    required this.proxyType,
    required this.proxyAddress,
    required this.proxyPort,
    this.proxyLogin,
    this.proxyPassword,
    this.action,
    this.cData,
    this.chlPageData,
    this.userAgent,
    this.cookies,
    this.isInvisible,
  }) : super(type: 'TurnstileTask');

  factory TurnstileTask.fromJson(Map<String, dynamic> json) =>
      _$TurnstileTaskFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TurnstileTaskToJson(this)..['type'] = type;
}
