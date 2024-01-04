import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/inputs/primary_text_field.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/counterState/counterState.dart';
import 'package:turn1checker/viewmodel/cardEdit/card_edit.dart';

class EditCounterBox extends HookConsumerWidget {
  const EditCounterBox({Key? key, required this.order}) : super(key: key);

  final int order;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardNotifier = ref.watch(cardEditNotifierProvider.notifier);
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 20),
      child: PrimaryTextField(
        name: 'effectCheckButton$order',
        label: '',
        onChanged: (value) => cardNotifier.updateCounter(
            order, (prev) => prev.copyWith(value: int.parse(value ?? ''))),
      ),
    );
  }
}
