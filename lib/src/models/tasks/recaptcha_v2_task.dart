import 'package:json_annotation/json_annotation.dart';
import 'captcha_task.dart';

part 'recaptcha_v2_task.g.dart';

@JsonSerializable()
class RecaptchaV2Task extends CaptchaTask {
  final String websiteURL;
  final String websiteKey;
  final String? websiteSToken;
  final String? recaptchaDataSValue;
  final bool? isInvisible;
  
  // Proxy parameters
  final String proxyType;
  final String proxyAddress;
  final int proxyPort;
  final String? proxyLogin;
  final String? proxyPassword;
  final String userAgent;
  final String? cookies;

  RecaptchaV2Task({
    required this.websiteURL,
    required this.websiteKey,
    required this.proxyType,
    required this.proxyAddress,
    required this.proxyPort,
    required this.userAgent,
    this.proxyLogin,
    this.proxyPassword,
    this.websiteSToken,
    this.recaptchaDataSValue,
    this.isInvisible,
    this.cookies,
  }) : super(type: 'RecaptchaV2Task');

  factory RecaptchaV2Task.fromJson(Map<String, dynamic> json) =>
      _$RecaptchaV2TaskFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecaptchaV2TaskToJson(this)..['type'] = type;
}
