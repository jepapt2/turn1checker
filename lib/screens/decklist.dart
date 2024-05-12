import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:turn1checker/components/deck/decklist_tile.dart';
import 'package:turn1checker/components/deck/deckname_modal.dart';
import 'package:turn1checker/hooks/card.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/utils/validations/decks.dart';
import 'package:turn1checker/viewmodel/deckList/deckList.dart';

import '../i18n/i18n.g.dart';

class DeckListScreen extends HookConsumerWidget {
  const DeckListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Deck> decks = ref.watch(deckListNotifierProvider);
    final decksNotifier = ref.watch(deckListNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.text.deckList),
        actions: [
          IconButton(
              onPressed: () => showDeckNameDialog(
                  context: context,
                  onCompleted: (name) async {
                    final deck = decksNotifier.createDeck(name);
                    context.push('/edit/${deck.id}');
                  }),
              icon: const Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: DeckListTile(
                deck: decks[index],
              ),
            );
          },
          itemCount: decks.length),
    );
  }
}
