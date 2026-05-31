class AntiCaptchaException implements Exception {
  final String message;
  final String? errorCode;

  AntiCaptchaException(this.message, {this.errorCode});

  @override
  String toString() {
    if (errorCode != null) {
      return 'AntiCaptchaException: [$errorCode] $message';
    }
    return 'AntiCaptchaException: $message';
  }
}
