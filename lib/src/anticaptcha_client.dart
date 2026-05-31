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
  final Dio _dio;

  AntiCaptchaClient(
    this.clientKey, {
    Dio? dio,
    Duration timeout = const Duration(seconds: 30),
  }) : _dio = dio ??
            Dio(BaseOptions(
              connectTimeout: timeout,
              receiveTimeout: timeout,
              headers: {'Content-Type': 'application/json'},
            ));

  /// Creates a captcha task and waits for the result.
  Future<GetTaskResultResponse> solve(
    CaptchaTask task, {
    Duration pollingInterval = const Duration(seconds: 2),
    int maxRetries = 60,
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

    throw AntiCaptchaException('Timeout: Task result not ready after $maxRetries retries');
  }

  Future<CreateTaskResponse> createTask(CaptchaTask task) async {
    try {
      final response = await _dio.post(
        AntiCaptchaConstants.createTaskUrl,
        data: {
          'clientKey': clientKey,
          'task': task.toJson(),
        },
      );
      return CreateTaskResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw AntiCaptchaException('Network error during createTask: ${e.message}');
    }
  }

  Future<GetTaskResultResponse> getTaskResult(int taskId) async {
    try {
      final response = await _dio.post(
        AntiCaptchaConstants.getTaskResultUrl,
        data: {
          'clientKey': clientKey,
          'taskId': taskId,
        },
      );
      return GetTaskResultResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw AntiCaptchaException('Network error during getTaskResult: ${e.message}');
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
      throw AntiCaptchaException('Network error downloading image: ${e.message}');
    }
  }
}
