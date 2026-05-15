import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/responses/user_badge_response.dart';
import 'package:flutter_app/features/learning/data/providers/learning_provider.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userBadgesProvider =
    AsyncNotifierProvider<UserBadgesNotifier, List<UserBadgeResponse>>(
      UserBadgesNotifier.new,
    );

class UserBadgesNotifier extends AsyncNotifier<List<UserBadgeResponse>>
    with TaskRunnerMixin<List<UserBadgeResponse>> {
  @override
  Future<List<UserBadgeResponse>> build() async {
    final user = ref.watch(authUserProvider);

    if (user.valueOrNull == null) {
      return [];
    }

    return getUserBadges();
  }

  Future<List<UserBadgeResponse>> getUserBadges() async {
    return runTask(
      flowName: 'UserBadgesFlow',
      startMessage: 'Obteniendo insignias del usuario...',
      successMessage: 'Insignias obtenidas exitosamente',
      errorMessage: 'ERROR al obtener insignias',
      action: () => ref.read(learningRepositoryProvider).getUserBadges(),
    );
  }
}
