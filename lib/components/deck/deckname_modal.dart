import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/buttons/gradient_button.dart';
import 'package:turn1checker/components/ui/dialogs/primary_simple_dialog.dart';
import 'package:turn1checker/components/ui/inputs/primary_text_field.dart';
import '../../i18n/i18n.g.dart';
import '../../utils/validations/decks.dart';

class DeckNameDialog extends ConsumerWidget {
  const DeckNameDialog({Key? key, required this.onCompleted, this.initialName})
      : super(key: key);
  final void Function(String name) onCompleted;
  final String? initialName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    return PrimarySimpleDialog(
      title: Text(initialName != null
          ? t.text.changeDeckNameDialogTitle
          : t.text.registerDeckNameDialogTitle),
      child: Column(
        children: [
          FormBuilder(
            key: formKey,
            child: PrimaryTextField(
              name: 'deckName',
              maxLength: 32,
              initialValue: initialName,
              validator: createDeckValidation,
            ),
          ),
          const SizedBox(height: 16),
          GradientButton(
              onPressed: () async {
                if (formKey.currentState!.saveAndValidate()) {
                  Navigator.pop(context);
                  onCompleted(formKey.currentState!.value['deckName']);
                }
              },
              text: initialName != null ? t.text.save : t.text.register)
        ],
      ),
    );
  }
}

void showDeckNameDialog(
    {required BuildContext context,
    required void Function(String name) onCompleted,
    String? initialName}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) => DeckNameDialog(
      onCompleted: onCompleted,
      initialName: initialName,
    ),
  );
}
