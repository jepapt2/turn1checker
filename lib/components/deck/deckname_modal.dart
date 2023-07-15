import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../i18n/i18n.g.dart';
import '../../utils/validations/decks.dart';
import '../../viewmodel/deck_list.dart';
import '../ui/cyan_gradient_button.dart';
import '../ui/primary_simple_dialog.dart';
import '../ui/primary_text_field.dart';

class DeckNameModal extends ConsumerWidget {
  const DeckNameModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    final decksNotifier = ref.watch(deckListProvider.notifier);
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
          CyanGradientButton(
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
  }
}
