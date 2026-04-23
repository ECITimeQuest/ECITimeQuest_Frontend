import 'package:flutter/material.dart';
import 'package:flutter_app/features/home/presentation/widgets/ai_tutor_card.dart';
import 'package:flutter_app/features/home/presentation/widgets/daily_challenge_card.dart';
import 'package:flutter_app/features/home/presentation/widgets/explore_eras_card.dart';
import 'package:flutter_app/features/home/presentation/widgets/mission_state_card.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 30,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hola, Crononauta",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text("Tu viaje por los siglos continúa"),
          ],
        ),
        MissionStateCard(),
        AiTutorCard(),
        DailyChallengeCard(),
        ExploreErasCard(),
      ],
    );
  }
}
