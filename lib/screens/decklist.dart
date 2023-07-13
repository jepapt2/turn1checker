import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:turn1checker/components/deck/decklist_tile.dart';
import 'package:turn1checker/components/ui/primary_floating_action_button.dart';
import 'package:turn1checker/components/ui/primary_text_field.dart';
import 'package:turn1checker/hooks/decks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/model/db/db.dart';
import 'package:turn1checker/utils/validations/decks.dart';
import 'package:turn1checker/viewmodel/deck_list.dart';
import '../components/ui/primary_button.dart';
import '../components/ui/primary_simple_dialog.dart';
import '../i18n/i18n.g.dart';

class DeckListScreen extends HookConsumerWidget {
  const DeckListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Deck>> decks = ref.watch(deckListProvider);
    final decksNotifier = ref.watch(deckListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.text.deckList),
        actions: [
          IconButton(
              onPressed: () => showDeckAddDialog(
                  context: context, decksNotifier: decksNotifier),
              icon: const Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
          child: decks.when(
              data: (decks) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: DeckListTile(
                                name: decks[index].name,
                                time: decks[index].updatedAt),
                          );
                        },
                        itemCount: decks.length),
                  ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'))),
    );
  }
}

showDeckAddDialog(
    {required BuildContext context, required DeckList decksNotifier}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      final formKey = GlobalKey<FormBuilderState>();
      return PrimarySimpleModal(
        title: Text(t.text.registerDeckName),
        child: Column(
          children: [
            FormBuilder(
              key: formKey,
              child: PrimaryTextField(
                name: 'deckName',
                maxLength: 32,
                validator: createDeckValidation,
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
                onPressed: () async {
                  if (formKey.currentState!.saveAndValidate()) {
                    Navigator.pop(context);
                    await decksNotifier
                        .createDeck(formKey.currentState!.value['deckName']);
                  }
                },
                text: t.text.register)
          ],
        ),
      );
    },
  );
}
