import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/inputs/number_text_field.dart';
import 'package:turn1checker/components/ui/inputs/primary_dropdown.dart';
import 'package:turn1checker/components/ui/inputs/primary_text_field.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/viewmodel/cardEdit/card_edit.dart';

class EditCounterBox extends HookConsumerWidget {
  const EditCounterBox(
      {Key? key,
      required this.order,
      required this.state,
      required this.cardEditNotifier})
      : super(key: key);

  final int order;
  final CounterButtonWithOrderState state;
  final CardEditNotifier cardEditNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                NumberTextField(
                  maxLength: 6,
                  label: t.text.initialValue,
                  name: 'initialValue',
                  placeholder: '0',
                  initialValue: state.counterButton.initialValue.toString(),
                  onChanged: (value) => cardEditNotifier.cardButtonsNotifier
                      .updateCounter(
                          order,
                          (prev) =>
                              prev.copyWith(initialValue: value, value: value)),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 1,
                      child: PrimaryDropDown(
                        name: 'button1',
                        label: '${t.text.button}1',
                        initialValue: state.counterButton.buttons[0] > 0
                            ? CounterButtonIncrementType.add
                            : CounterButtonIncrementType.remove,
                        items: const [
                          DropdownMenuItem(
                            value: CounterButtonIncrementType.add,
                            alignment: Alignment.center,
                            child: Text('+'),
                          ),
                          DropdownMenuItem(
                            value: CounterButtonIncrementType.remove,
                            alignment: Alignment.center,
                            child: Text('-'),
                          ),
                        ],
                        onChanged: (value) {
                          cardEditNotifier.updateCounterButton(
                              order: order,
                              buttonIndex: 0,
                              incrimentType: value);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                        flex: 3,
                        child: NumberTextField(
                            maxLength: 4,
                            name: 'counterButton1',
                            placeholder: "1",
                            initialValue:
                                state.counterButton.buttons[0].abs().toString(),
                            onChanged: (value) {
                              cardEditNotifier.updateCounterButton(
                                  order: order, value: value, buttonIndex: 0);
                            }))
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 1,
                      child: PrimaryDropDown(
                        name: 'button2',
                        label: '${t.text.button}2',
                        initialValue: state.counterButton.buttons[1] > 0
                            ? CounterButtonIncrementType.add
                            : CounterButtonIncrementType.remove,
                        items: const [
                          DropdownMenuItem(
                            value: CounterButtonIncrementType.add,
                            alignment: Alignment.center,
                            child: Text('+'),
                          ),
                          DropdownMenuItem(
                            value: CounterButtonIncrementType.remove,
                            alignment: Alignment.center,
                            child: Text('-'),
                          ),
                        ],
                        onChanged: (value) {
                          cardEditNotifier.updateCounterButton(
                              order: order,
                              buttonIndex: 1,
                              incrimentType: value);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      flex: 3,
                      child: NumberTextField(
                          maxLength: 4,
                          name: 'counterButton1',
                          placeholder: "1",
                          initialValue:
                              state.counterButton.buttons[1].abs().toString(),
                          onChanged: (value) =>
                              cardEditNotifier.updateCounterButton(
                                  order: order, buttonIndex: 1, value: value)),
                    )
                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () => cardEditNotifier.removeButton(order),
              icon: const Icon(
                Icons.delete_outline,
                color: ColorTheme.white,
              ))
        ],
      ),
    );
  }
}
