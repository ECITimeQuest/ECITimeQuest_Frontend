import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/features/learning/presentation/providers/quiz_notifier.dart';
import 'package:flutter_app/features/learning/presentation/widgets/quiz_option_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizOptionsList extends ConsumerWidget {
  const QuizOptionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizNotifierProvider);
    if (quizState == null) return const SizedBox.shrink();
    final question = quizState.currentQuestion;

    return Column(
      children: question.options.asMap().entries.map((entry) {
        final index = entry.key;
        final optionText = entry.value;
        final isSelected = quizState.selectedIndex == index;
        final isSubmitted = quizState.isSubmitted;

        Color? backgroundColor;
        Color? textColor;

        if (isSubmitted) {
          if (index == question.correctIndex) {
            backgroundColor = AppColors.success;
            textColor = Colors.white;
          } else if (isSelected) {
            backgroundColor = AppColors.error;
            textColor = Colors.white;
          }
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: QuizOptionItem(
            letter: String.fromCharCode(65 + index),
            text: optionText,
            selected: isSelected,
            backgroundColor: backgroundColor,
            textColor: textColor,
            onTap: isSubmitted
                ? null
                : () {
                    ref.read(quizNotifierProvider.notifier).selectOption(index);
                  },
          ),
        );
      }).toList(),
    );
  }
}
