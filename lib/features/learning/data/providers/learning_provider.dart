import 'package:flutter_app/core/network/dio_client_provider.dart';
import 'package:flutter_app/features/learning/data/datasources/learning_datasource.dart';
import 'package:flutter_app/features/learning/data/repositories/learning_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final learningProvider = Provider<LearningDataSource>((ref) {
  return LearningDataSource(ref.watch(dioProvider));
});

final learningRepositoryProvider = Provider<LearningRepository>((ref) {
  return LearningRepository(ref.watch(learningProvider));
});
