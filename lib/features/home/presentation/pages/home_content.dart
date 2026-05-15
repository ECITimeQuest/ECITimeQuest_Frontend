import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/features/home/presentation/widgets/ai_tutor_card.dart';
import 'package:flutter_app/features/home/presentation/widgets/explore_eras_card.dart';
import 'package:flutter_app/features/home/presentation/widgets/mission_state_card.dart';
import 'package:flutter_app/core/widgets/upgrade_plan_widget.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';

/// Controla si el banner de upgrade es visible en el home.
final showUpgradeBannerProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
);

class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  ConsumerState<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && ref.read(authUserProvider).valueOrNull != null) {
        ref.read(authUserProvider.notifier).loadMe();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authUserProvider).valueOrNull;
    final isPremium = user != null && user.subscriptionPlan.isPremium;
    final showBanner = ref.watch(showUpgradeBannerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 30,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hola, Crononauta",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text("Tu viaje por los siglos continúa"),
          ],
        ),
        if (isPremium)
          const UpgradePlanWidget(
            title: '¡Eres Premium!',
            message:
                'Disfruta de contenido personalizado en base a tus debilidades, recibe retroalimentación e indaga sobre tus dificultades libremente con tu IA Tutor.',
            isDialog: false,
            showButtons: false,
          )
        else if (showBanner)
          UpgradePlanWidget(
            title: 'Potencia tu aprendizaje',
            message:
                'Mejora a Premium para recibir contenido basado en tus debilidades, obtener retroalimentación e indagar sobre tus dificultades.',
            isDialog: false,
            showButtons: true,
            onDismiss: () =>
                ref.read(showUpgradeBannerProvider.notifier).state = false,
          ),
        MissionStateCard(),
        AiTutorCard(),
        // DailyChallengeCard(),
        ExploreErasCard(),
      ],
    );
  }
}
