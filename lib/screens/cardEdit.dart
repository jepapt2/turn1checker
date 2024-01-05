import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turn1checker/components/card/card_buttons.dart';
import 'package:turn1checker/components/card/edit_counter.dart';
import 'package:turn1checker/components/card/edit_effect_button.dart';
import 'package:turn1checker/components/ui/buttons/CyanGradientRectangleButton.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/inputs/primary_dropdown.dart';
import 'package:turn1checker/components/ui/inputs/primary_text_field.dart';
import 'package:turn1checker/model/cardButtons/cardButtons.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/model/realm.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/utils/functions/getObjectId.dart';
import 'package:turn1checker/utils/functions/pick_and_crop_image.dart';
import 'package:turn1checker/viewmodel/cardEdit/card_edit.dart';
import 'package:turn1checker/viewmodel/deckEdit/deckEdit.dart';
import '../i18n/i18n.g.dart';

class CardEditScreen extends HookConsumerWidget {
  const CardEditScreen({Key? key, this.deckId, this.cardId}) : super(key: key);

  final String? deckId;
  final String? cardId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Deck deck = ref.watch(deckEditNotifierProvider(getObjectId(deckId)));
    final cardNotifier = ref.watch(cardEditNotifierProvider.notifier);
    final double mediaWidth = MediaQuery.of(context).size.width;
    final formKey = GlobalKey<FormBuilderState>();
    final cardType = realm.all<CardType>();
    final cardTypeItems = cardType
        .map((e) => DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(e.color),
                    border: Border.all(
                        color: const Color.fromARGB(255, 87, 87, 87),
                        width: 0.5),
                  ),
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 10),
                Text(e.name)
              ],
            )))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(t.text.cardEdit),
          actions: [],
        ),
        body: Column(
          children: [
            Container(
              color: ColorTheme.black,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Consumer(builder: (context, ref, w) {
                      final card = ref.watch(cardEditNotifierProvider);
                      return Center(child: CardButtonsList(card: card));
                    })),
              ),
            ),
            Expanded(
                child: FormBuilder(
              key: formKey,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          PrimaryTextField(
                            name: 'name',
                            label: t.text.name,
                            onChanged: (value) => cardNotifier.updateState(
                                (prev) => prev.copyWith(name: value ?? '')),
                          ),
                          const SizedBox(height: 16),
                          PrimaryDropDown(
                              name: 'type',
                              label: t.text.cardType,
                              items: cardTypeItems,
                              onChanged: (value) {
                                final color = value?.color;
                                if (color != null) {
                                  cardNotifier.updateState((prev) =>
                                      prev.copyWith(color: Color(color)));
                                }
                              }),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t.text.illustration,
                                  style: const TextStyle(
                                      color: ColorTheme.white, fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(children: [
                                CyanGradientRectangleButton(
                                    text: 'カメラから選択',
                                    icon: Icons.check_box_outlined,
                                    onPressed: () => cardNotifier.addCounter()),
                                const SizedBox(width: 10),
                                CyanGradientRectangleButton(
                                    text: 'ギャラリーから選択',
                                    icon: Icons.image,
                                    onPressed: () async {
                                      final imagePath =
                                          await pickAndCropImage();
                                      if (imagePath != null) {
                                        cardNotifier.updateState((prev) =>
                                            prev.copyWith(image: imagePath));
                                      }
                                    }),
                              ]),
                            ],
                          ),
                          Consumer(builder: (context, ref, w) {
                            var buttonList = ref
                                .watch(cardEditNotifierProvider)
                                .buttonWithOrderState;
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: buttonList.length,
                              itemBuilder: (context, index) {
                                final editButtonInput = buttonList[index];
                                if (editButtonInput
                                    is EffectCheckButtonWithOrderState) {
                                  return EditEffectButtonBox(order: index + 1);
                                }
                                return EditCounterBox(order: index + 1);
                              },
                            );
                          }),
                        ],
                      )),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorTheme.primary,
                          width: 0.4,
                        ),
                      ),
                    ),
                    child: Row(children: [
                      Expanded(
                        child: CyanGradientRectangleButton(
                            text: 'ボタンを追加',
                            icon: Icons.check_box_outlined,
                            onPressed: () =>
                                cardNotifier.addEditEffectButton()),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CyanGradientRectangleButton(
                            text: 'カウンターを追加',
                            icon: Icons.check_box_outlined,
                            onPressed: () => cardNotifier.addCounter()),
                      ),
                    ]),
                  ),
                ],
              )),
            )),
          ],
        ));
  }
}
