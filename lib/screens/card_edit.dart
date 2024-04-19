import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:turn1checker/components/card/card_buttons.dart';
import 'package:turn1checker/components/card/edit_counter.dart';
import 'package:turn1checker/components/card/edit_effect_button.dart';
import 'package:turn1checker/components/ui/buttons/CyanGradientRectangleButton.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/buttons/gradient_button.dart';
import 'package:turn1checker/components/ui/inputs/primary_dropdown.dart';
import 'package:turn1checker/components/ui/inputs/primary_text_field.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/card_type.dart';
import 'package:turn1checker/utils/functions/getObjectId.dart';
import 'package:turn1checker/utils/functions/pick_and_crop_image.dart';
import 'package:turn1checker/viewmodel/cardEdit/card_edit.dart';

import '../i18n/i18n.g.dart';

class CardEditScreen extends HookConsumerWidget {
  const CardEditScreen({Key? key, this.deckId, this.cardId}) : super(key: key);

  final String? deckId;
  final String? cardId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardState =
        ref.watch(cardEditNotifierProvider(getObjectId(deckId), null));
    final cardNotifier =
        ref.read(cardEditNotifierProvider(getObjectId(deckId), null).notifier);
    final double mediaWidth = MediaQuery.of(context).size.width;
    final formKey = GlobalKey<FormBuilderState>();

    final cardTypeItems = CardType.values
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
                Text(e.toString())
              ],
            )))
        .toList();

    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
        appBar: AppBar(
          title: Text(t.text.cardEdit),
        ),
        body: Column(
          children: [
            Container(
              color: ColorTheme.black,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                        child: Stack(
                      children: [
                        CardButtonsList(
                            card: cardState,
                            cardButtonsNotifier:
                                cardNotifier.cardButtonsNotifier),
                      ],
                    ))),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: bottomSpace),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          child: Column(
                            children: [
                              PrimaryTextField(
                                name: 'name',
                                label: t.text.name,
                                initialValue: cardState.name,
                                onChanged: (value) {
                                  cardNotifier.cardButtonsNotifier.update(
                                      (prev) =>
                                          prev.copyWith(name: value ?? ''));
                                },
                              ),
                              const SizedBox(height: 16),
                              PrimaryDropDown(
                                  name: 'type',
                                  label: t.text.cardType,
                                  initialValue: cardState.type,
                                  items: cardTypeItems,
                                  onChanged: (type) {
                                    cardNotifier.cardButtonsNotifier.update(
                                        (prev) => prev.copyWith(type: type));
                                  }),
                              const SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(t.text.illustration,
                                      style: const TextStyle(
                                          color: ColorTheme.white,
                                          fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Row(children: [
                                    CyanGradientRectangleButton(
                                        text: 'カメラから選択',
                                        icon: Icons.check_box_outlined,
                                        onPressed: () async {
                                          final result =
                                              await context.push('/camera');
                                          if (result is Uint8List) {
                                            final image = result;
                                            cardNotifier.cardButtonsNotifier
                                                .update((prev) => prev.copyWith(
                                                    editImage: image));
                                          }
                                        }),
                                    const SizedBox(width: 10),
                                    CyanGradientRectangleButton(
                                        text: 'ギャラリーから選択',
                                        icon: Icons.image,
                                        onPressed: () async {
                                          final imagePath =
                                              await pickAndCropImage();
                                          if (imagePath != null) {
                                            final image = imagePath;
                                            cardNotifier.cardButtonsNotifier
                                                .update((prev) => prev.copyWith(
                                                    editImage: image));
                                          }
                                        }),
                                  ]),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Visibility(
                                visible:
                                    cardState.buttonWithOrderState.isNotEmpty,
                                child: const Divider(
                                  color: ColorTheme.primary,
                                  thickness: 0.4,
                                ),
                              ),
                              Visibility(
                                visible:
                                    cardState.buttonWithOrderState.isNotEmpty,
                                child: ListView.separated(
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                    color: ColorTheme.primary,
                                    thickness: 0.4,
                                  ),
                                  itemCount:
                                      cardState.buttonWithOrderState.length,
                                  itemBuilder: (context, index) {
                                    final editButtonInput =
                                        cardState.buttonWithOrderState[index];
                                    if (editButtonInput
                                        is EffectCheckButtonWithOrderState) {
                                      return EditEffectButtonBox(
                                        order: index + 1,
                                        cardEditNotifier: cardNotifier,
                                      );
                                    }
                                    return EditCounterBox(
                                      order: index + 1,
                                      cardEditNotifier: cardNotifier,
                                    );
                                  },
                                ),
                              ),
                              if (cardState.buttonWithOrderState.length < 3)
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                  ),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
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
                                              cardNotifier.addEffectButton()),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CyanGradientRectangleButton(
                                          text: 'カウンターを追加',
                                          icon: Icons.check_box_outlined,
                                          onPressed: () =>
                                              cardNotifier.addCounter()),
                                    ),
                                  ]),
                                ),
                              const SizedBox(
                                height: 40,
                              ),
                              GradientButton(
                                onPressed: () => cardNotifier.saveCard(),
                                text: '保存',
                                height: 52,
                                fontSize: 18,
                                theme: GradientButtonTheme.orange,
                              ),
                              const SizedBox(
                                height: 40,
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
