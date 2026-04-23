import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';

class MissionStateCard extends StatelessWidget {
  const MissionStateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ESTADO DE LA MISIÓN",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.black.withValues(alpha: 0.50),
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      "Tu Odisea Histórica",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Chip(
                label: Text("Nivel 14"),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Progreso actual",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text("65%", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              LinearProgressIndicator(value: 0.65),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _MissionStateCardItem(
                  text: "Reliquias halladas",
                  value: "24/40",
                ),
              ),
              Expanded(
                child: _MissionStateCardItem(
                  text: "Eras completadas",
                  value: "3",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MissionStateCardItem extends StatelessWidget {
  final String text;
  final String value;

  const _MissionStateCardItem({required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      verticalPadding: 20,
      color: AppColors.surfaceVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
