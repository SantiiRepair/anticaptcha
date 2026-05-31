abstract class CaptchaTask {
  final String type;

  CaptchaTask({required this.type});

  Map<String, dynamic> toJson();
}
