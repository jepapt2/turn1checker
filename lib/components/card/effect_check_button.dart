import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/viewmodel/cardEdit/card_edit.dart';

class EffectCheckButtonWidget extends HookConsumerWidget {
  const EffectCheckButtonWidget({Key? key, required this.state})
      : super(key: key);

  final EffectCheckButtonWithOrderState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EffectCheckButtonState button = state.effectButton;
    final cardNotifier = ref.watch(cardEditNotifierProvider.notifier);
    return Expanded(
      child: GestureDetector(
        onTap: () => cardNotifier.updateEffectCheckButton(state.order, (prev) {
          if (prev.count >= prev.limit) {
            return prev;
          }
          return prev.copyWith(count: prev.count + 1);
        }),
        onLongPress: () => cardNotifier.updateEffectCheckButton(
            state.order, (prev) => prev.copyWith(count: 0)),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: ColorTheme.cardBorderGray, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: button.count,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(166, 243, 177, 102)),
                    ),
                  ),
                  Flexible(
                    flex: button.limit - button.count,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(20, 56, 222, 169),
                            Color.fromARGB(100, 52, 63, 90)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  button.description,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(224, 28, 28, 28),
                          offset: Offset(0, 0),
                          blurRadius: 16,
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
