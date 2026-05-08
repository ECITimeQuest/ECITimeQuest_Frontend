import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/app_button.dart';
import 'package:flutter_app/features/learning/data/models/responses/submit_answer_response.dart';
import 'package:flutter_app/features/learning/presentation/providers/ia_notifier.dart';
import 'package:flutter_app/features/learning/presentation/widgets/ia_explanation_section.dart';
import 'package:flutter_app/features/learning/presentation/widgets/reward_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedbackModal extends StatefulWidget {
  final bool isCorrect;
  final SubmitAnswerResponse? result;
  final Future<void> Function() onNext;
  final bool isLast;

  const FeedbackModal({
    super.key,
    required this.isCorrect,
    this.result,
    required this.onNext,
    this.isLast = false,
  });

  @override
  State<FeedbackModal> createState() => _FeedbackModalState();
}

class _FeedbackModalState extends State<FeedbackModal> {
  bool _isProcessingNext = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final iaState = ref.watch(iaProvider);

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.isCorrect ? Icons.check_circle : Icons.error,
                    color: widget.isCorrect
                        ? AppColors.success
                        : AppColors.error,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.isCorrect
                        ? "¡Respuesta Correcta!"
                        : "Respuesta Incorrecta",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: widget.isCorrect
                          ? AppColors.success
                          : AppColors.error,
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (!widget.isCorrect) ...[
                    IAExplanationSection(iaState: iaState),
                    const SizedBox(height: 24),
                  ],
                  if (widget.result != null) ...[
                    RewardItem(
                      icon: Icons.bolt,
                      label: "+${widget.result!.xpEarned} XP",
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 8),
                    RewardItem(
                      icon: Icons.monetization_on,
                      label: "+${widget.result!.coinsEarned} Monedas",
                      color: Colors.amber,
                    ),
                    if (!widget.isCorrect && widget.result!.livesLost > 0) ...[
                      const SizedBox(height: 8),
                      RewardItem(
                        icon: Icons.favorite,
                        label:
                            "-${widget.result!.livesLost} Vida${widget.result!.livesLost > 1 ? 's' : ''}",
                        color: AppColors.error,
                      ),
                    ],
                  ],
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      label: widget.isLast
                          ? "Finalizar desafío"
                          : "Siguiente pregunta",
                      icon: const Icon(Icons.arrow_forward, size: 18),
                      isLoading: _isProcessingNext,
                      loadingLabel: "Finalizando...",
                      onPressed: _handleNext,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _handleNext() async {
    setState(() => _isProcessingNext = true);

    try {
      await widget.onNext();
    } finally {
      if (mounted) {
        setState(() => _isProcessingNext = false);
      }
    }
  }
}
