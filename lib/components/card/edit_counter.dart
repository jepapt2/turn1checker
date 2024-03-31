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
  const EditCounterBox({Key? key, required this.order}) : super(key: key);

  final int order;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardNotifier = ref.watch(cardEditNotifierProvider.notifier);
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 20),
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
                  onChanged: (value) => cardNotifier.updateCounter(
                      order,
                      (prev) =>
                          prev.copyWith(initialValue: value, value: value)),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: PrimaryDropDown(
                        name: 'button1',
                        label: '${t.text.button}1',
                        items: const [
                          DropdownMenuItem(
                            value: CounterButtonIncrementType.add,
                            child: Text('+'),
                          ),
                          DropdownMenuItem(
                            value: CounterButtonIncrementType.remove,
                            child: Text('-'),
                          ),
                        ],
                        onChanged: (value) {
                          cardNotifier.updateCounterButton(
                              order: order,
                              buttonIndex: 0,
                              incrimentType: value);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                        child: NumberTextField(
                            maxLength: 4,
                            name: 'counterButton1',
                            onChanged: (value) {
                              cardNotifier.updateCounterButton(
                                  order: order, value: value, buttonIndex: 0);
                            }))
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: PrimaryDropDown(
                        name: 'button2',
                        label: '${t.text.button}2',
                        items: const [
                          DropdownMenuItem(
                            value: CounterButtonIncrementType.add,
                            child: Text('+'),
                          ),
                          DropdownMenuItem(
                            value: CounterButtonIncrementType.remove,
                            child: Text('-'),
                          ),
                        ],
                        onChanged: (value) {
                          cardNotifier.updateCounterButton(
                              order: order,
                              buttonIndex: 1,
                              incrimentType: value);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: NumberTextField(
                          maxLength: 4,
                          name: 'counterButton1',
                          onChanged: (value) =>
                              cardNotifier.updateCounterButton(
                                  order: order, buttonIndex: 1, value: value)),
                    )
                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () => cardNotifier.removeButton(order),
              icon: const Icon(
                Icons.delete_outline,
                color: ColorTheme.white,
              ))
        ],
      ),
    );
  }
}
