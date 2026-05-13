import 'package:flutter_app/features/ia/data/datasources/ia_datasource.dart';
import 'package:flutter_app/features/ia/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/ia/data/models/responses/ia_task_response.dart';

class IARepository {
  final IADataSource _iaDataSource;

  IARepository(this._iaDataSource);

  Future<IATaskResponse> requestIATask(IATaskRequest request) {
    return _iaDataSource.requestIATask(request);
  }

  Future<IATaskResponse> getIATask(String taskId) {
    return _iaDataSource.getIATask(taskId);
  }
}
