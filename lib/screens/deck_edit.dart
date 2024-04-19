import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/components/card/card_buttons.dart';
import 'package:turn1checker/components/deck/decklist_tile.dart';
import 'package:turn1checker/components/deck/deckname_modal.dart';
import 'package:turn1checker/components/ui/buttons/primary_floating_action_button.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/utils/functions/cardAspectRatio.dart';
import 'package:turn1checker/utils/functions/card_class_convert.dart';

import 'package:turn1checker/utils/validations/decks.dart';
import 'package:turn1checker/viewmodel/deck_edit/deck_edit.dart';
import 'package:turn1checker/viewmodel/local_path/local_path.dart';
import '../i18n/i18n.g.dart';

class DeckEditScreen extends HookConsumerWidget {
  const DeckEditScreen({Key? key, this.id}) : super(key: key);

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
    final Deck deck = ref.watch(deckEditNotifierProvider(getObjectId()));
    return Scaffold(
      appBar: AppBar(
        title: Text(deck.name),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: cardAspectRatio(context: context)),
            itemCount: deck.cards.length,
            itemBuilder: (BuildContext context, int index) {
              final card = deck.cards[index];
              return GestureDetector(
                onTap: () => context.push('/edit/${deck.id}/card/${card.id}'),
                child: AbsorbPointer(
                  absorbing: true,
                  child: CardButtonsList(
                    card: cardButtonsConvertDbToState(card),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: PrimaryFloatingActionButton(
        onPressed: () => context.push('/edit/${deck.id}/card/new'),
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
