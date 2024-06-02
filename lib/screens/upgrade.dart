import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:turn1checker/components/card/card_buttons.dart';
import 'package:turn1checker/components/card/edit_counter.dart';
import 'package:turn1checker/components/card/edit_effect_button.dart';
import 'package:turn1checker/components/ui/buttons/gradient_rectangle_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/buttons/gradient_button.dart';
import 'package:turn1checker/components/ui/buttons/primary_rectangle_button.dart';
import 'package:turn1checker/components/ui/dialogs/confirm_dialog.dart';
import 'package:turn1checker/components/ui/inputs/primary_dropdown.dart';
import 'package:turn1checker/components/ui/inputs/primary_text_field.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/card_type.dart';
import 'package:turn1checker/utils/functions/getObjectId.dart';
import 'package:turn1checker/utils/functions/pick_and_crop_image.dart';
import 'package:turn1checker/viewmodel/cardEdit/card_edit.dart';
import 'package:turn1checker/viewmodel/deckList/deckList.dart';
import 'package:turn1checker/viewmodel/local_data/local_data.dart';
import 'package:turn1checker/viewmodel/purchase/purchase.dart';

import '../i18n/i18n.g.dart';

class UpgradeScreen extends HookConsumerWidget {
  const UpgradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseProvider = ref.watch(purchaseNotifierProvider(context));
    final purchaseNotifier =
        ref.watch(purchaseNotifierProvider(context).notifier);
    final localDataProvider = ref.watch(localDataNotifierProvider);
    final deckListProvider = ref.watch(deckListNotifierProvider);
    final isLoadingPurchase = useState(false);

    return Scaffold(
        appBar: AppBar(
          title: Text(t.text.upgrade),
        ),
        body: purchaseProvider.maybeWhen(
            data: (offerings) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(t.text.currentDeckSlot),
                            const SizedBox(width: 8),
                            Text(
                              '${deckListProvider.length}/${localDataProvider.value?.deckSlot.toString() ?? '2'}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: ColorTheme.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 400),
                          decoration: BoxDecoration(
                              color: ColorTheme.primary,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text(t.text.deckSlot5,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 16),
                              GradientButton(
                                theme: GradientButtonTheme.orange,
                                onPressed: () async {
                                  try {
                                    isLoadingPurchase.value = true;
                                    await purchaseNotifier.purchaseDeckSlot5();
                                  } finally {
                                    isLoadingPurchase.value = false;
                                  }
                                },
                                isLoading: isLoadingPurchase.value,
                                width: 200,
                                text: offerings.current
                                        ?.getPackage('deckSlot5')
                                        ?.storeProduct
                                        .priceString ??
                                    '',
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 400),
                          decoration: BoxDecoration(
                              color: ColorTheme.primary,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text(t.text.removeAds,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Text(t.text.withDeckSlot3,
                                  style: const TextStyle(fontSize: 16)),
                              const SizedBox(height: 8),
                              GradientButton(
                                theme: GradientButtonTheme.orange,
                                onPressed: purchaseNotifier.existRemoveAds()
                                    ? null
                                    : () async {
                                        try {
                                          isLoadingPurchase.value = true;
                                          await purchaseNotifier
                                              .purchaseRemoveAds();
                                        } finally {
                                          isLoadingPurchase.value = false;
                                        }
                                      },
                                width: 200,
                                isLoading: isLoadingPurchase.value,
                                text: purchaseNotifier.existRemoveAds()
                                    ? t.text.existPurchase
                                    : offerings.current?.lifetime?.storeProduct
                                            .priceString ??
                                        '',
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        GestureDetector(
                          onTap: isLoadingPurchase.value
                              ? null
                              : () async {
                                  try {
                                    isLoadingPurchase.value = true;
                                    await purchaseNotifier.restore();
                                  } finally {
                                    isLoadingPurchase.value = false;
                                  }
                                },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: isLoadingPurchase.value
                                      ? const Color.fromARGB(55, 241, 241, 241)
                                      : ColorTheme.white,
                                ),
                              ),
                            ),
                            child: Text(
                              t.text.restore,
                              style: TextStyle(
                                fontSize: 16,
                                color: isLoadingPurchase.value
                                    ? Color.fromARGB(55, 241, 241, 241)
                                    : ColorTheme.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator())));
  }
}
