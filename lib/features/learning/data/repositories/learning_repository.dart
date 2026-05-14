import 'package:flutter_app/features/learning/data/datasources/learning_datasource.dart';
import 'package:flutter_app/features/learning/data/models/requests/finish_session_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/start_session_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/submit_answer_request.dart';
import 'package:flutter_app/features/learning/data/models/responses/concept_gap_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/era_mastery_item_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/learning_session_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/submit_answer_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/user_badge_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/user_progress_response.dart';

class LearningRepository {
  final LearningDataSource _dataSource;

  LearningRepository(this._dataSource);

  Future<LearningSessionResponse> startSession(StartSessionRequest request) {
    return _dataSource.startSession(request);
  }

  Future<SubmitAnswerResponse> submitAnswer(SubmitAnswerRequest request) {
    return _dataSource.submitAnswer(request);
  }

  Future<LearningSessionResponse> finishSession(
    FinishSessionRequest request,
    String sessionId,
  ) {
    return _dataSource.finishSession(request, sessionId);
  }

  Future<UserProgressResponse> getUserProgress() {
    return _dataSource.getUserProgress();
  }

  Future<List<UserBadgeResponse>> getUserBadges() {
    return _dataSource.getUserBadges();
  }

  Future<List<ConceptGapResponse>> getConceptGaps() {
    return _dataSource.getConceptGaps();
  }

  Future<List<EraMasteryItemResponse>> getEraMastery() {
    return _dataSource.getEraMastery();
  }
}
