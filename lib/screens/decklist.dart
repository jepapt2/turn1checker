import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:turn1checker/components/deck/decklist_tile.dart';
import 'package:turn1checker/components/deck/deckname_modal.dart';
import 'package:turn1checker/components/ui/dialogs/confirm_dialog.dart';
import 'package:turn1checker/hooks/card.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/router/router.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/utils/validations/decks.dart';
import 'package:turn1checker/viewmodel/deckList/deckList.dart';
import 'package:turn1checker/viewmodel/local_data/local_data.dart';
import 'package:turn1checker/viewmodel/purchase/purchase.dart';

import '../i18n/i18n.g.dart';

class DeckListScreen extends HookConsumerWidget {
  const DeckListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Deck> decks = ref.watch(deckListNotifierProvider);
    final decksNotifier = ref.watch(deckListNotifierProvider.notifier);
    final localData = ref.watch(localDataNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(t.text.deckList),
          actions: localData.hasValue
              ? [
                  IconButton(
                      onPressed: () async {
                        if ((decks.length >=
                            (localData.value?.deckSlot ?? 2))) {
                          if (await showConfirmDialog(
                              context: context,
                              description:
                                  '${t.text.currentDeckSlot} ${localData.value?.deckSlot}\n${t.text.deckSlotDescription}',
                              yesButtonText: t.text.goToPurchase,
                              descriptionTextStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal))) {
                            router.go('/upgrade');
                          }
                          return;
                        } else {
                          if (!context.mounted) return;
                          showDeckNameDialog(
                              context: context,
                              onCompleted: (name) async {
                                final deck =
                                    decksNotifier.createDeck(name, context);
                                if (deck == null) return;
                                context.push('/edit/${deck.id}');
                              });
                        }
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 28,
                        color: Colors.white,
                      ))
                ]
              : [],
        ),
        drawer: Drawer(
          backgroundColor: ColorTheme.background,
          child: ListView(
            children: [
              ListTile(
                title: Text(t.text.removeAdsAndDeckSlot,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                onTap: () {
                  context.push('/upgrade');
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
        body: localData.maybeWhen(
          data: (localDataOptions) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(t.text.numberOfDeck),
                        const SizedBox(width: 8),
                        Text(
                          '${decks.length}/${localDataOptions.deckSlot}',
                          style: TextStyle(
                              color: decks.length >= localDataOptions.deckSlot
                                  ? ColorTheme.yellow
                                  : ColorTheme.white),
                        ),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                if (await showConfirmDialog(
                                    context: context,
                                    description:
                                        '${t.text.currentDeckSlot} ${localDataOptions.deckSlot}\n${t.text.deckSlotDescription}',
                                    yesButtonText: t.text.goToPurchase,
                                    descriptionTextStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal))) {
                                  router.go('/upgrade');
                                }
                              },
                              icon: const Icon(
                                Icons.help_center_outlined,
                                color: ColorTheme.yellow,
                                size: 20,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: DeckListTile(
                            deck: decks[index],
                          ),
                        );
                      },
                      itemCount: decks.length),
                ),
              ],
            );
          },
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
