import 'package:flutter_app/core/network/dio_client_provider.dart';
import 'package:flutter_app/features/content/data/datasources/content_datasource.dart';
import 'package:flutter_app/features/content/data/repositories/content_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentProvider = Provider<ContentDataSource>((ref) {
  return ContentDataSource(ref.watch(dioProvider));
});

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepository(ref.watch(contentProvider));
});
