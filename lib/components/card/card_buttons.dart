import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/card/counter.dart';
import 'package:turn1checker/components/card/effect_check_button.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/utils/functions/cardAspectRatio.dart';
import 'package:turn1checker/viewmodel/card_buttons/card_buttons.dart';
import 'package:turn1checker/viewmodel/local_path/local_path.dart';

class CardButtonsList extends StatelessWidget {
  const CardButtonsList({
    Key? key,
    required this.card,
    this.cardButtonsNotifier,
  }) : super(key: key);

  final CardButtonState card;
  final CardButtonsNotifier? cardButtonsNotifier;

  @override
  Widget build(BuildContext context) {
    final double cardWidth = getCardWidth(context: context, crossAxisCount: 2);

    Widget cardImage() {
      final editImage = card.editImage;
      final image = card.image;
      if (editImage != null) {
        return Image.memory(editImage);
      }
      if (image != null) {
        return Consumer(builder: (context, ref, child) {
          final filePath = ref.watch(localPathProvider).value;
          if (filePath == null) return const SizedBox();
          final imagePath = '$filePath/$image';
          return Image.file(File(imagePath));
        });
      }
      return const SizedBox();
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTheme.cardBorderGray, width: 1),
      ),
      width: cardWidth,
      height: cardWidth + 20,
      child: Column(
        children: [
          Container(
            color: ColorTheme.primary,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Color(card.type.color),
                  width: 6,
                  height: double.infinity,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  card.name,
                  style: const TextStyle(fontSize: 16, height: 1),
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: ColorTheme.background,
                ),
                cardImage(),
                Column(
                  children: card.buttonWithOrderState.map((e) {
                    if (e is EffectCheckButtonWithOrderState) {
                      final button = e;
                      return EffectCheckButtonWidget(
                        state: button,
                        onPress: () => cardButtonsNotifier
                            ?.pressEffectCheckButton(button.order),
                        onReset: () => cardButtonsNotifier
                            ?.resetEffectCheckButton(button.order),
                      );
                    }
                    if (e is CounterButtonWithOrderState) {
                      final counter = e;
                      return CounterWidget(
                        state: counter,
                        buttonsLength: card.buttonWithOrderState.length,
                        onCount: (value) => cardButtonsNotifier
                            ?.pressCounterButton(counter.order, value),
                        onReset: () => cardButtonsNotifier
                            ?.resetCounterButton(counter.order),
                      );
                    }
                    return const SizedBox();
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
