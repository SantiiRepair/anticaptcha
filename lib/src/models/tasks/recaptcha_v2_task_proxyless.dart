import 'package:json_annotation/json_annotation.dart';
import 'captcha_task.dart';

part 'recaptcha_v2_task_proxyless.g.dart';

@JsonSerializable()
class RecaptchaV2TaskProxyless extends CaptchaTask {
  final String websiteURL;
  final String websiteKey;
  final String? websiteSToken;
  final String? recaptchaDataSValue;
  final bool? isInvisible;

  RecaptchaV2TaskProxyless({
    required this.websiteURL,
    required this.websiteKey,
    this.websiteSToken,
    this.recaptchaDataSValue,
    this.isInvisible,
  }) : super(type: 'RecaptchaV2TaskProxyless');

  factory RecaptchaV2TaskProxyless.fromJson(Map<String, dynamic> json) =>
      _$RecaptchaV2TaskProxylessFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RecaptchaV2TaskProxylessToJson(this)..['type'] = type;
}
