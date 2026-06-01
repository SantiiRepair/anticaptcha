## 0.0.2+2

- Fix: Resolved 'type String is not a subtype of type num' cast errors by applying FlexibleIntConverter to all integer fields across all models.

## 0.0.2+1

- Fix: Ensure `getBalance` robustly parses API balance response as double.
- Fix: Use `FlexibleNumConverter` for `GetTaskResultResponse` fields to improve tolerance to varying JSON numeric formats.

## 0.0.2

- Fix: Removed default 30s network timeout in `AntiCaptchaClient` to prevent premature task abortion.
- Fix: Corrected syntax error in `AntiCaptchaClient` constructor.

## 0.0.1

- Initial release of the unofficial Anti-Captcha Dart library.
- Complete refactor using `Dio` for modern networking.
- Added support for:
    - Image to Text tasks.
    - reCAPTCHA V2 (Proxy and Proxyless).
    - Cloudflare Turnstile (Proxy and Proxyless).
- Added account balance retrieval.
- Integrated `json_serializable` for type-safe models.
- Automated CI/CD with GitHub Actions.
- Professional documentation and unit tests.
