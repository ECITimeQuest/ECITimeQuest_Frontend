import 'package:flutter_app/core/network/dio_client_provider.dart';
import 'package:flutter_app/features/ia/data/datasources/ia_datasource.dart';
import 'package:flutter_app/features/ia/data/repositories/ia_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final iaProvider = Provider<IADataSource>((ref) {
  return IADataSource(ref.watch(dioProvider));
});

final iaRepositoryProvider = Provider<IARepository>((ref) {
  return IARepository(ref.watch(iaProvider));
});
