import 'package:flutter/material.dart';
import 'package:flutter_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter_app/features/profile/presentation/widgets/profile_stats.dart';
import 'package:flutter_app/features/profile/presentation/widgets/mastery_section.dart';
import 'package:flutter_app/features/profile/presentation/widgets/badges_section.dart';
import 'package:flutter_app/features/profile/presentation/widgets/reinforcement_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileHeader(),
        SizedBox(height: 40),
        ProfileStats(),
        SizedBox(height: 40),
        MasterySection(),
        SizedBox(height: 32),
        BadgesSection(),
        SizedBox(height: 32),
        ReinforcementSection(),
        SizedBox(height: 40),
      ],
    );
  }
}
