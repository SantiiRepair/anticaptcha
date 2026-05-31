import 'package:json_annotation/json_annotation.dart';

part 'get_task_result_response.g.dart';

@JsonSerializable()
class GetTaskResultResponse {
  final int errorId;
  final String status;
  final Map<String, dynamic>? solution;
  final double? cost;
  final String? ip;
  final int? createTime;
  final int? endTime;
  final int? solveCount;
  final String? errorCode;
  final String? errorDescription;

  GetTaskResultResponse({
    required this.errorId,
    required this.status,
    this.solution,
    this.cost,
    this.ip,
    this.createTime,
    this.endTime,
    this.solveCount,
    this.errorCode,
    this.errorDescription,
  });

  factory GetTaskResultResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTaskResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTaskResultResponseToJson(this);

  bool get isReady => status == 'ready';
  bool get isProcessing => status == 'processing';
}
