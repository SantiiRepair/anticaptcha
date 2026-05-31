import 'package:json_annotation/json_annotation.dart';
import 'captcha_task.dart';

part 'recaptcha_v2_task.g.dart';

@JsonSerializable()
class RecaptchaV2Task extends CaptchaTask {
  final String websiteURL;
  final String websiteKey;
  final String? websiteSToken;
  final String? recaptchaDataSValue;
  final bool isInvisible;

  RecaptchaV2Task({
    required this.websiteURL,
    required this.websiteKey,
    this.websiteSToken,
    this.recaptchaDataSValue,
    this.isInvisible = false,
  }) : super(type: 'NoProxyTaskProxyless');

  factory RecaptchaV2Task.fromJson(Map<String, dynamic> json) =>
      _$RecaptchaV2TaskFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecaptchaV2TaskToJson(this)..['type'] = type;
}
