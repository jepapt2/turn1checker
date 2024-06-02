import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/dialogs/confirm_dialog.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/deck_state/deck_state.dart';
import 'package:turn1checker/utils/functions/cardAspectRatio.dart';
import 'package:turn1checker/utils/functions/getObjectId.dart';
import 'package:turn1checker/viewmodel/card_buttons/card_buttons.dart';
import 'package:turn1checker/viewmodel/deck/deck.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/components/card/card_buttons.dart';

class DeckScreen extends HookConsumerWidget {
  const DeckScreen({Key? key, this.id}) : super(key: key);

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DeckState deck = ref.watch(deckNotifierProvider(getDeckObjectId(id)));
    final DeckNotifier deckNotifier =
        ref.watch(deckNotifierProvider(getDeckObjectId(id)).notifier);

    return WillPopScope(
      onWillPop: () async {
        final isPop = await showConfirmDialog(
          context: context,
          description: t.text.closeDeckScreenConfirm,
        );
        if (isPop) {
          deckNotifier.onCloseDeck();
        }
        return isPop;
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(deck.name),
              floating: true,
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 80),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: cardAspectRatio(context: context),
                ),
                itemCount: deckNotifier.initialCardButtonStateList.length,
                itemBuilder: (context, index) {
                  return CardButtonsList(
                    card: ref.watch(cardButtonsNotifierProvider(
                        initialCardState:
                            deckNotifier.initialCardButtonStateList?[index])),
                    cardButtonsNotifier: ref.watch(cardButtonsNotifierProvider(
                            initialCardState:
                                deckNotifier.initialCardButtonStateList?[index])
                        .notifier),
                  );
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          height: 60,
          padding: EdgeInsets.zero,
          elevation: 0.4,
          child: Container(
            color: ColorTheme.primary,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                      visible: deck.turn > 1,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: () => deckNotifier.changeTurn(deck.turn - 1),
                      )),
                  Text(
                    'Turn ${deck.turn}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next,
                        color: deckNotifier.isLatestTurn()
                            ? ColorTheme.orange
                            : null),
                    onPressed: () => deckNotifier.changeTurn(deck.turn + 1),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
