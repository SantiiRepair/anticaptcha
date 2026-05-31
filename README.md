# AntiCaptcha Dart Client

[![Dart CI](https://github.com/SantiiRepair/anticaptcha/actions/workflows/dart_ci.yml/badge.svg)](https://github.com/SantiiRepair/anticaptcha/actions/workflows/dart_ci.yml)
[![Pub Version](https://img.shields.io/pub/v/anticaptcha)](https://pub.dev/packages/anticaptcha)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A modern, type-safe, and asynchronous Dart library for the [Anti-Captcha](https://anti-captcha.com) service. Powered by `Dio` and `json_serializable`.

---

## 🚀 Features

- **🛡️ Type-Safe**: Comprehensive models for all captcha tasks and responses.
- **⚡ Modern Networking**: Built on top of `Dio` for efficient HTTP requests and configurable timeouts.
- **🔄 Automated Polling**: Simplified result retrieval with smart polling logic.
- **💰 Balance Check**: Easily check your account balance.
- **🆔 Soft ID Support**: Support for developer attribution (softId).
- **🛠️ Extensible**: Easily support new captcha types like Cloudflare Turnstile, Recaptcha V2, and more.
- **📦 Clean Architecture**: Organized codebase for better maintainability.

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  anticaptcha: ^0.0.1
```

Then run:

```bash
dart pub get
```

## 🛠️ Usage

### Quick Start

```dart
import 'package:anticaptcha/anticaptcha.dart';

void main() async {
  // Initialize the client with your API key and optional softId
  final client = AntiCaptchaClient('YOUR_API_KEY', softId: 162);

  // Check balance
  final balance = await client.getBalance();
  print('Current Balance: $balance');

  try {
    // Solve an Image-to-Text captcha
    final base64Image = await client.imageToBase64('captcha.jpeg');
    final result = await client.solve(ImageToTextTask(body: base64Image));
    
    print('Captcha Solved: ${result.solution?['text']}');
  } on AntiCaptchaException catch (e) {
    print('Error: ${e.message}');
  }
}
```

### Supported Captcha Types

#### Cloudflare Turnstile
```dart
final result = await client.solve(
  TurnstileTask(
    websiteURL: 'https://example.com',
    websiteKey: 'YOUR_TURNSTILE_KEY',
    action: 'login', // optional
  ),
);

print('Token: ${result.solution?['token']}');
```

#### Recaptcha V2 (Proxyless)
```dart
final result = await client.solve(
  RecaptchaV2Task(
    websiteURL: 'https://example.com',
    websiteKey: 'YOUR_RECAPTCHA_KEY',
  ),
);
print('gRecaptchaResponse: ${result.solution?['gRecaptchaResponse']}');
```

## ⚙️ Advanced Configuration

You can customize the `Dio` instance or adjust polling behavior:

```dart
final client = AntiCaptchaClient(
  'YOUR_API_KEY',
  timeout: Duration(seconds: 45), // Custom HTTP timeout
);

final result = await client.solve(
  task,
  pollingInterval: Duration(seconds: 3), // Wait 3s between checks
  maxRetries: 40,                       // Total attempts
);
```

## 🧪 Testing

The library uses `dotenv` for integration tests. Create a `.env` file in the root directory:

```env
ANTICAPTCHA_KEY=your_actual_api_key
```

Then run:

```bash
dart test
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Disclaimer: This is an unofficial library and is not affiliated with Anti-Captcha.com.*
