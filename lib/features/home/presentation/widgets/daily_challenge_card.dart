import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';

class DailyChallengeCard extends StatelessWidget {
  const DailyChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgrounds/roma.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.60),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                "RETO DIARIO",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.70),
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "¿Qué pasó hoy en la antigua Roma?",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.tertiary),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
              ),
              child: Text(
                "Empezar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
