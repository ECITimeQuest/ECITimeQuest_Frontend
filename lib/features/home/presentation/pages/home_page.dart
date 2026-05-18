import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/features/home/presentation/pages/home_content.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_app/features/home/presentation/widgets/bottom_navbar.dart';
import 'package:flutter_app/features/home/presentation/widgets/navbar_item.dart';
import 'package:flutter_app/features/content/presentation/pages/periods_list_page.dart';
import 'package:flutter_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_app/features/subscription/presentation/pages/subscription_page.dart';
import 'package:flutter_app/features/learning/presentation/pages/quiz_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  final List<Widget> _pages = const [
    HomeContent(),
    PeriodsListPage(),
    SubscriptionPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationIndexProvider);
    final overlay = ref.watch(homeOverlayProvider);
    final isQuizActive = overlay is QuizPage;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Row(
          spacing: 8,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/app_icon.png',
                height: 32,
                width: 32,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "TimeQuest",
              style: TextStyle(color: AppColors.primary, letterSpacing: -1.3),
            ),
          ],
        ),
        actions: [
          Container(margin: EdgeInsets.only(right: 15), child: NavbarItem()),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            20,
            20,
            MediaQuery.of(context).padding.bottom + (isQuizActive ? 20 : 110),
          ),
          child: overlay ?? _pages[selectedIndex],
        ),
      ),
      bottomNavigationBar: isQuizActive
          ? null
          : SafeArea(
              child: BottomNavBar(
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  ref.read(homeOverlayProvider.notifier).state = null;
                  ref.read(navigationIndexProvider.notifier).state = index;
                },
              ),
            ),
    );
  }
}
