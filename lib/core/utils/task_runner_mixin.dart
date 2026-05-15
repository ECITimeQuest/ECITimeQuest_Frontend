import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin TaskRunnerMixin<S> {
  AsyncValue<S> get state;
  set state(AsyncValue<S> value);

  Future<T> runTask<T>({
    required String flowName,
    required String startMessage,
    required String successMessage,
    required String errorMessage,
    required Future<T> Function() action,
  }) async {
    state = AsyncLoading<S>();

    developer.log(startMessage, name: flowName, level: 800);

    final result = await AsyncValue.guard<T>(() async {
      return await action();
    });

    if (result.hasError) {
      developer.log(
        errorMessage,
        name: flowName,
        error: result.error,
        stackTrace: result.stackTrace,
        level: 1000,
      );
    } else {
      developer.log(successMessage, name: flowName, level: 800);
    }

    if (result is AsyncValue<S>) {
      state = result as AsyncValue<S>;
    }

    if (result.hasError) {
      throw result.error!;
    }

    return result.requireValue;
  }
}
