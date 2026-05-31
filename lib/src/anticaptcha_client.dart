import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'constants.dart';
import 'exceptions/anticaptcha_exception.dart';
import 'models/responses/create_task_response.dart';
import 'models/responses/get_task_result_response.dart';
import 'models/tasks/captcha_task.dart';

class AntiCaptchaClient {
  final String clientKey;
  final int? softId;
  final Dio _dio;

  AntiCaptchaClient(
    this.clientKey, {
    this.softId,
    Dio? dio,
    Duration timeout = const Duration(seconds: 30),
  }) : _dio =
           dio ??
           Dio(
             BaseOptions(
               connectTimeout: timeout,
               receiveTimeout: timeout,
               headers: {
                 'Content-Type': 'application/json',
                 'Accept': 'application/json',
               },
             ),
           );

  /// Gets the account balance.
  Future<double> getBalance() async {
    try {
      final response = await _dio.post(
        'https://api.anti-captcha.com/getBalance',
        data: {'clientKey': clientKey},
      );
      final data = response.data as Map<String, dynamic>;
      if (data['errorId'] != 0) {
        throw AntiCaptchaException(
          data['errorDescription'] ?? 'Failed to get balance',
          errorCode: data['errorCode']?.toString(),
        );
      }
      return (data['balance'] as num).toDouble();
    } on DioException catch (e) {
      throw AntiCaptchaException(
        'Network error during getBalance: ${e.message}',
      );
    }
  }

  /// Creates a captcha task and waits for the result.
  Future<GetTaskResultResponse> solve(
    CaptchaTask task, {
    Duration pollingInterval = const Duration(seconds: 2),
    int maxRetries = 150, // Official SDK uses ~300s total, so 150 * 2s = 300s
  }) async {
    final createResponse = await createTask(task);
    if (createResponse.errorId != 0 || createResponse.taskId == null) {
      throw AntiCaptchaException(
        createResponse.errorDescription ?? 'Failed to create task',
        errorCode: createResponse.errorCode,
      );
    }

    final taskId = createResponse.taskId!;
    int retries = 0;

    while (retries < maxRetries) {
      await Future.delayed(pollingInterval);
      final result = await getTaskResult(taskId);

      if (result.errorId != 0) {
        throw AntiCaptchaException(
          result.errorDescription ?? 'Failed to get task result',
          errorCode: result.errorCode,
        );
      }

      if (result.isReady) {
        return result;
      }

      retries++;
    }

    throw AntiCaptchaException(
      'Timeout: Task result not ready after ${maxRetries * pollingInterval.inSeconds} seconds',
    );
  }

  Future<CreateTaskResponse> createTask(CaptchaTask task) async {
    try {
      final Map<String, dynamic> payload = {
        'clientKey': clientKey,
        'task': task.toJson(),
      };
      if (softId != null) {
        payload['softId'] = softId!;
      }

      final response = await _dio.post(
        AntiCaptchaConstants.createTaskUrl,
        data: payload,
      );
      return CreateTaskResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw AntiCaptchaException(
        'Network error during createTask: ${e.message}',
      );
    }
  }

  Future<GetTaskResultResponse> getTaskResult(int taskId) async {
    try {
      final response = await _dio.post(
        AntiCaptchaConstants.getTaskResultUrl,
        data: {'clientKey': clientKey, 'taskId': taskId},
      );
      return GetTaskResultResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw AntiCaptchaException(
        'Network error during getTaskResult: ${e.message}',
      );
    }
  }

  Future<String> imageToBase64(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw AntiCaptchaException('File not found: $filePath');
    }
    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }

  Future<String> networkImageToBase64(String imageUrl) async {
    try {
      final response = await _dio.get<List<int>>(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      if (response.data == null) {
        throw AntiCaptchaException('Failed to download image: empty response');
      }
      return base64Encode(response.data!);
    } on DioException catch (e) {
      throw AntiCaptchaException(
        'Network error downloading image: ${e.message}',
      );
    }
  }
}
