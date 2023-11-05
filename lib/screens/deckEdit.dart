import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/components/deck/decklist_tile.dart';
import 'package:turn1checker/components/deck/deckname_modal.dart';
import 'package:turn1checker/components/ui/primary_button.dart';
import 'package:turn1checker/components/ui/primary_floating_action_button.dart';
import 'package:turn1checker/components/ui/primary_text_field.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/utils/functions/cardAspectRatio.dart';

import 'package:turn1checker/utils/validations/decks.dart';
import 'package:turn1checker/viewmodel/deckEdit/deckEdit.dart';
import '../components/ui/cyan_gradient_button.dart';
import '../components/ui/primary_simple_dialog.dart';
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
    final double mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(deck.name),
        actions: [
          IconButton(
              onPressed: () => showDeckAddDialog(context: context),
              icon: const Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: cardAspectRatio(mediaWidth: mediaWidth)),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.blue,
                //正方形にするために高さを横幅と同じにする
              );
            }),
      ),
    );
  }
}

showDeckAddDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) => const DeckNameModal(),
  );
}
