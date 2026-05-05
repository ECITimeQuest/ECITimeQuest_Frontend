import 'package:flutter_app/features/learning/data/models/enums/task_status.dart';
import 'ia_task_data.dart';

class IATaskResponse {
  final TaskStatus taskStatus;
  final String? taskId;
  final String? source;
  final IATaskData? data;
  final String? error;

  const IATaskResponse({
    required this.taskStatus,
    this.taskId,
    this.source,
    this.data,
    this.error,
  });

  factory IATaskResponse.fromJson(Map<String, dynamic> json) {
    final source = json['source'] as String?;
    final rawData = json['data'] as Map<String, dynamic>?;

    return IATaskResponse(
      taskStatus: TaskStatus.fromApiValue(json['status'] as String),
      taskId: json['task_id'] as String?,
      source: source,
      error: json['error'] as String?,
      data: (rawData != null) ? IATaskData.fromJson(rawData) : null,
    );
  }
}
