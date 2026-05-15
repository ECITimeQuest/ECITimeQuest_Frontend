import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';

class ProfileHeader extends ConsumerStatefulWidget {
  const ProfileHeader({super.key});

  @override
  ConsumerState<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends ConsumerState<ProfileHeader> {
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
    final userState = ref.watch(authUserProvider);
    final user = userState.valueOrNull;
    final isPremium = user?.subscriptionPlan.isPremium ?? false;
    final email = user?.email;
    final nameFromUser = user?.name;

    final displayName = (nameFromUser != null && nameFromUser.isNotEmpty)
        ? nameFromUser
        : (email != null && email.contains('@'))
        ? email.split('@').first
        : 'Usuario';

    return Column(
      children: [
        _buildAvatar(isPremium),
        const SizedBox(height: 24),
        Text(
          displayName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isPremium ? AppColors.tertiary : null,
            fontWeight: isPremium ? FontWeight.bold : null,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.auto_awesome,
              color: AppColors.secondary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Explorador',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatar(bool isPremium) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF263238),
            border: Border.all(color: Colors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Center(
            child: Icon(Icons.person_rounded, size: 80, color: Colors.white54),
          ),
        ),
        if (isPremium)
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.tertiary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: const Icon(
                Icons.verified,
                color: Colors.black87,
                size: 18,
              ),
            ),
          ),
      ],
    );
  }
}
