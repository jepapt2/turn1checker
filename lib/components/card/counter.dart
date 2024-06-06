import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/card/counter_button.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/counterState/counterState.dart';
import 'package:turn1checker/utils/functions/cardAspectRatio.dart';
import 'package:turn1checker/viewmodel/cardEdit/card_edit.dart';

class CounterWidget extends HookConsumerWidget {
  const CounterWidget(
      {Key? key,
      required this.state,
      required this.buttonsLength,
      required this.onCount,
      required this.onReset})
      : super(key: key);

  final CounterButtonWithOrderState state;
  final int buttonsLength;
  final void Function(int value) onCount;
  final void Function() onReset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CounterState counter = state.counterButton;
    final double cardWidth = getCardWidth(context: context, crossAxisCount: 2);
    final minWidgetHeight = cardWidth / 3;
    final bool isMinSize = buttonsLength >= 3;
    final double valueHeight = isMinSize ? minWidgetHeight * 0.5 : 40;
    final double buttonHeight = isMinSize ? minWidgetHeight * 0.35 : 32;

    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: ColorTheme.cardBorderGray, width: 1),
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(50, 56, 222, 169),
              Color.fromARGB(50, 52, 63, 90)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Visibility(
            visible: buttonsLength != 1,
            child: SizedBox(
              height: minWidgetHeight * 0.05,
            ),
          ),
          Flexible(
            child: Stack(
              children: [
                Align(
                  alignment: buttonsLength == 1
                      ? Alignment.center
                      : Alignment.topCenter,
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: valueHeight * 1.75,
                    ),
                    height: valueHeight,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    color: const Color.fromARGB(100, 0, 0, 0),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      alignment: Alignment.centerRight,
                      child: Text(
                        min(max(counter.value, 0), 999999).toString(),
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: SizedBox(
                      width: isMinSize ? 20 : 24,
                      height: isMinSize ? 20 : 24,
                      child: IconButton.filled(
                          color: ColorTheme.white,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(50, 0, 0, 0)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          0)))), // Set the size to be a square with a side length of 40
                          padding: const EdgeInsets.all(0),
                          onPressed: () => onReset(),
                          icon: Icon(
                            Icons.refresh,
                            size: isMinSize ? 16 : 20,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: isMinSize,
            child: SizedBox(
              height: minWidgetHeight * 0.05,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: state.counterButton.buttons
                  .map((e) => CounterButtonWidget(
                      height: buttonHeight,
                      onPressed: () => onCount(e),
                      value: e))
                  .toList(),
            ),
          ),
          Visibility(
            visible: isMinSize,
            child: SizedBox(
              height: minWidgetHeight * 0.05,
            ),
          ),
        ]),
      ),
    );
  }
}
