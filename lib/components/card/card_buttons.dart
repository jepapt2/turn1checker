import 'dart:io';

import 'package:flutter/material.dart';
import 'package:turn1checker/components/card/effect_check_button.dart';
import 'package:turn1checker/model/cardButtons/cardButtons.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/utils/functions/cardAspectRatio.dart';

class CardButtonsList extends StatelessWidget {
  const CardButtonsList({Key? key, required this.card}) : super(key: key);

  final CardButtonState card;

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    final double cardWidth =
        getCardWidth(mediaWidth: mediaWidth, crossAxisCount: 2);

    Widget cardImage() {
      final image = card.image;
      if (image != null) {
        return image;
      } else {
        return const SizedBox();
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTheme.cardBorderGray, width: 1),
      ),
      child: Column(
        children: [
          Container(
            color: ColorTheme.primary,
            width: cardWidth,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: card.color,
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
          Column(
            children: [
              Container(
                color: ColorTheme.background,
                width: cardWidth,
                height: cardWidth,
                child: Stack(
                  children: [
                    cardImage(),
                    Column(
                      children: card.buttonWithOrderState.map((e) {
                        if (e is EffectCheckButtonWithOrderState) {
                          final button = e;
                          return EffectCheckButtonWidget(state: button);
                        }
                        if (e is CounterButtonWithOrderState) {
                          final counter = e;
                          return SizedBox(
                            width: cardWidth,
                            child: Column(
                              children: [
                                Text(counter.order.toString()),
                              ],
                            ),
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
        ],
      ),
    );
  }
}
