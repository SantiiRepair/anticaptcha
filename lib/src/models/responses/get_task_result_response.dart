import 'package:json_annotation/json_annotation.dart';
import '../../utils/json_converters.dart';

part 'get_task_result_response.g.dart';

@JsonSerializable()
class GetTaskResultResponse {
  final int errorId;
  final String status;
  final Map<String, dynamic>? solution;
  
  @FlexibleDoubleConverter()
  final double? cost;
  
  final String? ip;
  
  @FlexibleIntConverter()
  final int? createTime;
  
  @FlexibleIntConverter()
  final int? endTime;
  
  @FlexibleIntConverter()
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
