import 'package:flutter/material.dart';
import 'package:flutter_app/features/learning/presentation/widgets/question_progress_header.dart';
import 'package:flutter_app/features/learning/presentation/widgets/question_option_item.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 30,
      children: [
        QuestionProgressHeader(
          moduleName: 'IMPERIO ROMANO',
          chipContent: '4/10',
        ),
        Text(
          "¿Cúal fue la causa principal de la caída del Imperio Romano de Occidente?",
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: Colors.black),
        ),
        Column(
          spacing: 18,
          children: [
            QuestionOptionItem(
              letter: 'A',
              text: 'Invasiones bárbaras',
              selected: selectedOptionIndex == 0,
              onTap: () => setState(() => selectedOptionIndex = 0),
            ),
            QuestionOptionItem(
              letter: 'B',
              text: 'Crisis económica y exceso de expansión',
              selected: selectedOptionIndex == 1,
              onTap: () => setState(() => selectedOptionIndex = 1),
            ),
            QuestionOptionItem(
              letter: 'C',
              text: 'Inestabilidad política y corrupción',
              selected: selectedOptionIndex == 2,
              onTap: () => setState(() => selectedOptionIndex = 2),
            ),
            QuestionOptionItem(
              letter: 'D',
              text: 'Todas las anteriores',
              selected: selectedOptionIndex == 3,
              onTap: () => setState(() => selectedOptionIndex = 3),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text("Confirmar respuesta"),
                Icon(Icons.arrow_forward, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
