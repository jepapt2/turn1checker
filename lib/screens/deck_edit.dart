import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:turn1checker/components/card/card_buttons.dart';
import 'package:turn1checker/components/deck/deckname_modal.dart';
import 'package:turn1checker/components/ui/buttons/primary_floating_action_button.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/dialogs/confirm_dialog.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/utils/functions/cardAspectRatio.dart';
import 'package:turn1checker/utils/functions/card_class_convert.dart';
import 'package:turn1checker/utils/functions/getObjectId.dart';
import 'package:turn1checker/viewmodel/deckList/deckList.dart';
import 'package:turn1checker/viewmodel/deck_edit/deck_edit.dart';
import '../i18n/i18n.g.dart';

class DeckEditScreen extends HookConsumerWidget {
  const DeckEditScreen({Key? key, this.id}) : super(key: key);

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Deck deck = ref.watch(deckEditNotifierProvider(getDeckObjectId(id)));
    final DeckEditNotifier deckEditNotifier =
        ref.watch(deckEditNotifierProvider(getDeckObjectId(id)).notifier);
    final DeckListNotifier deckListNotifier =
        ref.watch(deckListNotifierProvider.notifier);
    final isManualSorting = useState(false);
    return WillPopScope(
      onWillPop: () async {
        deckListNotifier.fetchDecks();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(deck.name),
          actions: [
            isManualSorting.value
                ? IconButton(
                    padding: const EdgeInsets.only(right: 8),
                    onPressed: () => isManualSorting.value = false,
                    icon: const Icon(
                      Icons.sort,
                      color: ColorTheme.orange,
                      shadows: [
                        Shadow(
                          color: ColorTheme.orange,
                          offset: Offset(0, 0),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: PopupMenuButton(
                        padding: EdgeInsets.zero,
                        child: const Icon(Icons.sort),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text(t.text.sortCardType),
                                onTap: () => deckEditNotifier.cardTypeSort(),
                              ),
                              PopupMenuItem(
                                child: Text(t.text.manualSort),
                                onTap: () => isManualSorting.value = true,
                              ),
                            ]),
                  ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: PopupMenuButton(
                  child: const Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(t.text.changeDeckName),
                          onTap: () => showDeckNameDialog(
                              context: context,
                              initialName: deck.name,
                              onCompleted: (name) =>
                                  deckEditNotifier.updateDeckName(name)),
                        ),
                        PopupMenuItem(
                          child: Text(t.text.deleteDeck),
                          onTap: () async {
                            await showConfirmDialog(
                                    context, t.text.deleteDeckConfirm)
                                .then((result) => {
                                      if (result)
                                        {
                                          deckEditNotifier.deleteDeck(),
                                          Navigator.pop(context)
                                        }
                                    });
                          },
                        ),
                      ]),
            )
          ],
        ),
        body: ReorderableGridView.count(
          padding:
              const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 80),
          dragStartDelay: const Duration(milliseconds: 100),
          dragEnabled: isManualSorting.value,
          onReorder: (oldIndex, newIndex) {
            deckEditNotifier.manualSort(oldIndex, newIndex);
          },
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: cardAspectRatio(context: context),
          children: deck.cards.map((card) {
            return GestureDetector(
              key: ValueKey(card.id),
              onTap: () => isManualSorting.value
                  ? null
                  : context.push('/edit/${deck.id}/card/${card.id}'),
              child: AbsorbPointer(
                absorbing: true,
                child: CardButtonsList(
                  card: cardButtonsConvertDbToState(card),
                ),
              ),
            );
          }).toList(),
        ),
        floatingActionButton: PrimaryFloatingActionButton(
          onPressed: () => context.push('/edit/${deck.id}/card/new'),
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
      ),
    );
  }
}
