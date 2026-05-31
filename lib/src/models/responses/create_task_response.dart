import 'package:json_annotation/json_annotation.dart';

part 'create_task_response.g.dart';

@JsonSerializable()
class CreateTaskResponse {
  final int errorId;
  final int? taskId;
  final String? errorCode;
  final String? errorDescription;

  CreateTaskResponse({
    required this.errorId,
    this.taskId,
    this.errorCode,
    this.errorDescription,
  });

  factory CreateTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTaskResponseToJson(this);
}
