import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/inputs/primary_dropdown.dart';
import 'package:turn1checker/components/ui/inputs/primary_text_field.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/viewmodel/cardEdit/card_edit.dart';

class EditEffectButtonBox extends HookConsumerWidget {
  const EditEffectButtonBox(
      {Key? key, required this.order, required this.cardEditNotifier})
      : super(key: key);

  final int order;
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
                Row(
                  children: [
                    Flexible(
                      child: PrimaryDropDown(
                        name: 'preliod',
                        label: '${t.text.turn}/${t.text.duel}',
                        items: [
                          DropdownMenuItem(
                            value: EffectLimitPeriod.turn,
                            child: Text(t.text.turn),
                          ),
                          DropdownMenuItem(
                            value: EffectLimitPeriod.duel,
                            child: Text(t.text.duel),
                          ),
                        ],
                        onChanged: (value) =>
                            cardEditNotifier.updateEffectCheckButton(order,
                                (prev) => prev.copyWith(limitPeriod: value)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: PrimaryDropDown(
                        label: t.text.numberOfTimes,
                        name: 'limit',
                        onChanged: (value) =>
                            cardEditNotifier.updateEffectCheckButton(order,
                                (prev) => prev.copyWith(limit: value ?? 1)),
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text('1'),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text('2'),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text('3'),
                          ),
                          DropdownMenuItem(
                            value: 4,
                            child: Text('4'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                PrimaryTextField(
                  label: t.text.effectDescription,
                  name: 'effectCheckButton$order',
                  onChanged: (value) =>
                      cardEditNotifier.updateEffectCheckButton(order,
                          (prev) => prev.copyWith(description: value ?? '')),
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
