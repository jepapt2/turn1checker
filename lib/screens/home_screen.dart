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
import 'package:turn1checker/viewmodel/deck_list.dart';
import '../components/ui/primary_button.dart';
import '../components/ui/primary_simple_dialog.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final AsyncValue<List<Deck>> decks = ref.watch(deckListProvider);
    final decksNotifier = ref.watch(deckListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.deckList),
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
      floatingActionButton: PrimaryFloatingActionButton(
          onPressed: () =>
              showDeckAddDialog(context: context, decksNotifier: decksNotifier),
          child: const Icon(Icons.add, size: 32)),
    );
  }
}

showDeckAddDialog(
    {required BuildContext context, required DeckList decksNotifier}) {
  final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      final formKey = GlobalKey<FormBuilderState>();
      return PrimarySimpleModal(
        title: Text(appLocalizations.registerDeckName),
        child: Column(
          children: [
            FormBuilder(
              key: formKey,
              child: PrimaryTextField(
                  name: 'deckName',
                  maxLength: 32,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: appLocalizations.deckNameRequiredError),
                    FormBuilderValidators.minLength(1,
                        errorText: appLocalizations.deckNameMinLengthError(1)),
                    FormBuilderValidators.maxLength(32,
                        errorText: appLocalizations.deckNameMaxLengthError(32)),
                  ])),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
                onPressed: () async {
                  if (formKey.currentState!.saveAndValidate()) {
                    Navigator.pop(context);
                    await decksNotifier
                        .createDeck(formKey.currentState!.value['deckName']);
                    // Decks().createDeck('testaaa');
                  }
                },
                text: appLocalizations.register)
          ],
        ),
      );
    },
  );
}
