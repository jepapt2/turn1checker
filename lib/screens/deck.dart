import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/deck_state/deck_state.dart';
import 'package:turn1checker/utils/functions/cardAspectRatio.dart';
import 'package:turn1checker/viewmodel/card_buttons/card_buttons.dart';
import 'package:turn1checker/viewmodel/deck/deck.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/components/card/card_buttons.dart';

class DeckScreen extends HookConsumerWidget {
  const DeckScreen({Key? key, this.id}) : super(key: key);

  final String? id;

  ObjectId getObjectId() {
    final v = id;
    if (v == null) {
      throw Exception('Deck not found');
    }
    return ObjectId.fromHexString(v);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DeckState deck = ref.watch(deckNotifierProvider(getObjectId()));
    final DeckNotifier deckNotifier =
        ref.watch(deckNotifierProvider(getObjectId()).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(deck.name),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 80),
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
      bottomNavigationBar: BottomAppBar(
        height: 60,
        padding: EdgeInsets.zero,
        elevation: 0.0,
        child: Container(
          color: ColorTheme.primary,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Visibility(
                visible: deck.turn > 1,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () => deckNotifier.nextTurn(deck.turn - 1),
                )),
            Text('turn ${deck.turn}'),
            IconButton(
              icon: Icon(Icons.skip_next,
                  color:
                      deckNotifier.isLatestTurn() ? ColorTheme.orange : null),
              onPressed: () => deckNotifier.nextTurn(deck.turn + 1),
            ),
          ]),
        ),
      ),
    );
  }
}
