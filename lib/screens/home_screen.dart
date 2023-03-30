import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:turn1checker/components/ui/primary_floating_action_button.dart';
import 'package:turn1checker/components/ui/primary_text_field.dart';
import 'package:turn1checker/hooks/decks.dart';

import '../components/ui/primary_button.dart';
import '../components/ui/primary_simple_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.deckList),
      ),
      body: Center(
          child: StreamBuilder(
        stream: Decks().watchDecks(),
        builder: (a, b) {
          if (b.hasError) {
            return Text(b.error.toString());
          }
          if (!b.hasData) {
            return const CircularProgressIndicator();
          }
          return ListView.builder(
              itemCount: b.data!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(b.data![i].name),
                );
              });
        },
      )),
      floatingActionButton: PrimaryFloatingActionButton(
          onPressed: () => showDeckAddDialog(context),
          child: const Icon(Icons.add, size: 32)),
    );
  }
}

showDeckAddDialog(BuildContext context) {
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
                onPressed: () {
                  if (formKey.currentState!.saveAndValidate()) {
                    Navigator.pop(context);
                    Decks().createDeck(formKey.currentState!.value['deckName']);
                  }
                },
                text: appLocalizations.register)
          ],
        ),
      );
    },
  );
}
