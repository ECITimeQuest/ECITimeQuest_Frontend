import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';

class AiTutorCard extends StatelessWidget {
  const AiTutorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      color: AppColors.secondaryContainer,
      child: Row(
        spacing: 35,
        children: [
          Icon(Icons.person, color: AppColors.secondary, size: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  "TUTOR DE IA",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '"¡Hola!, ¿listo para descubrir el renacimiento?"',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      "Continuar charla",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: AppColors.secondary,
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
