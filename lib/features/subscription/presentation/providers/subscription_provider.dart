import 'package:flutter_app/core/network/api_exception.dart';
import 'package:flutter_app/features/auth/data/models/enums/subscription_plan.dart';
import 'package:flutter_app/features/auth/data/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Estado que contiene el id del usuario y su plan actual.
class SubscriptionState {
  final String userId;
  final SubscriptionPlan plan;

  const SubscriptionState({required this.userId, required this.plan});

  SubscriptionState copyWith({String? userId, SubscriptionPlan? plan}) {
    return SubscriptionState(
      userId: userId ?? this.userId,
      plan: plan ?? this.plan,
    );
  }
}

class SubscriptionNotifier extends AsyncNotifier<SubscriptionState> {
  @override
  Future<SubscriptionState> build() async {
    final repo = ref.read(authRepositoryProvider);
    final user = await repo.getMe();
    return SubscriptionState(userId: user.id, plan: user.subscriptionPlan);
  }

  /// Cambia el plan del usuario llamando al backend y actualiza el estado local.
  Future<void> changePlan(SubscriptionPlan newPlan) async {
    final current = state.valueOrNull;
    if (current == null) return;

    // Guardamos el estado anterior por si hay error
    final previousState = current;

    // Optimistic loading: mostramos loading sin perder los datos actuales
    state = const AsyncLoading<SubscriptionState>()
        .copyWithPrevious(AsyncData(current));

    final result = await AsyncValue.guard<SubscriptionState>(() async {
      final repo = ref.read(authRepositoryProvider);
      final updated = await repo.updateSubscription(
        current.userId,
        newPlan.toApiValue(),
      );
      return SubscriptionState(
        userId: updated.id,
        plan: updated.subscriptionPlan,
      );
    });

    if (result.hasError) {
      // Restaurar el estado anterior en caso de error
      state = AsyncError<SubscriptionState>(
        result.error!,
        result.stackTrace!,
      ).copyWithPrevious(AsyncData(previousState));
    } else {
      state = result;
    }
  }
}

final subscriptionProvider =
    AsyncNotifierProvider<SubscriptionNotifier, SubscriptionState>(
      SubscriptionNotifier.new,
    );

/// Helper: devuelve solo el plan actual o free como fallback.
/// Útil para widgets que solo necesitan el plan sin gestionar el AsyncValue.
extension SubscriptionStateX on AsyncValue<SubscriptionState> {
  SubscriptionPlan get currentPlanOrFree =>
      whenOrNull(data: (s) => s.plan) ?? SubscriptionPlan.free;
}

/// Excepción de suscripción con mensaje amigable.
extension ApiExceptionLabel on Object {
  String get friendlyMessage {
    if (this is ApiException) return (this as ApiException).message;
    return 'Ocurrió un error al cambiar el plan. Inténtalo de nuevo.';
  }
}
