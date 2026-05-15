import 'package:flutter/material.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageHeader extends ConsumerWidget {
  final String title;
  final bool showBackButton;

  const PageHeader({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        if (showBackButton)
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => ref.read(homeOverlayProvider.notifier).state = null,
          ),
        if (!showBackButton) const SizedBox(width: 4),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
