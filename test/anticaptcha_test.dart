import 'dart:io';
import 'package:test/test.dart';
import 'package:dotenv/dotenv.dart';
import 'package:anticaptcha/anticaptcha.dart';

void main() {
  final env = DotEnv(includePlatformEnvironment: true)..load();
  final apiKey = env['ANTICAPTCHA_KEY'];

  group('AntiCaptchaClient Integration Tests', () {
    if (apiKey == null || apiKey.isEmpty) {
      print('Skipping integration tests: ANTICAPTCHA_KEY not found in .env');
      return;
    }

    final client = AntiCaptchaClient(apiKey);

    test('imageToBase64 should encode file', () async {
      // Create a dummy file for testing
      final file = File('test_image.txt');
      await file.writeAsString('fake image data');
      
      final base64 = await client.imageToBase64('test_image.txt');
      expect(base64, isNotEmpty);
      
      await file.delete();
    });

    // Note: We don't run full solver tests by default to save user balance, 
    // but we test the model serialization and client initialization.
    test('Client initializes correctly', () {
      expect(client.clientKey, equals(apiKey));
    });
  });

  group('Model Serialization', () {
    test('ImageToTextTask toJson', () {
      final task = ImageToTextTask(body: 'base64data', phrase: true);
      final json = task.toJson();
      expect(json['type'], 'ImageToTextTask');
      expect(json['body'], 'base64data');
      expect(json['phrase'], true);
    });

    test('TurnstileTask toJson', () {
      final task = TurnstileTask(websiteURL: 'url', websiteKey: 'key');
      final json = task.toJson();
      expect(json['type'], 'TurnstileTaskProxyless');
      expect(json['websiteURL'], 'url');
    });
  });
}
