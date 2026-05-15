import 'package:flutter_app/features/ia/data/models/enums/task_type.dart';
import 'package:flutter_app/features/ia/data/models/requests/ia_task_context.dart';

class IATaskRequest {
  final TaskType taskType;
  final String referenceId;
  final IATaskContext context;

  const IATaskRequest({
    required this.taskType,
    required this.referenceId,
    required this.context,
  });

  Map<String, dynamic> toJson() {
    return {
      'task_type': taskType.toApiValue(),
      'reference_id': referenceId,
      'context': context.toJson(),
    };
  }
}
