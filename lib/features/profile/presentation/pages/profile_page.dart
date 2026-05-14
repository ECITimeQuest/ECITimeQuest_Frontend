import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/app_button.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_app/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter_app/features/profile/presentation/widgets/profile_stats.dart';
import 'package:flutter_app/features/profile/presentation/widgets/mastery_section.dart';
import 'package:flutter_app/features/profile/presentation/widgets/badges_section.dart';
import 'package:flutter_app/features/profile/presentation/widgets/concept_gaps_section.dart';

import 'package:flutter_app/features/learning/presentation/providers/concept_gaps_notifier.dart';
import 'package:flutter_app/features/learning/presentation/providers/user_badges_notifier.dart';
import 'package:flutter_app/features/learning/presentation/providers/era_mastery_notifier.dart';
import 'package:flutter_app/features/learning/presentation/providers/user_progress_notifier.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.invalidate(userProgressProvider);
      ref.invalidate(eraMasteryProvider);
      ref.invalidate(userBadgesProvider);
      ref.invalidate(conceptGapsProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ProfileHeader(),
        const SizedBox(height: 40),
        const ProfileStats(),
        const SizedBox(height: 40),
        const MasterySection(),
        const SizedBox(height: 32),
        const BadgesSection(),
        const SizedBox(height: 32),
        const ConceptGapsSection(),
        const SizedBox(height: 48),
        SizedBox(
          width: double.infinity,
          child: AppButton(
            label: 'Cerrar Sesión',
            icon: const Icon(Icons.logout),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              await ref.read(authUserProvider.notifier).signOut();
              ref.read(navigationIndexProvider.notifier).state = 0;
              ref.read(homeOverlayProvider.notifier).state = null;

              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const AuthPage()),
                  (route) => false,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
