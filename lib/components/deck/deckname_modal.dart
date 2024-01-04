import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/buttons/cyan_gradient_button.dart';
import 'package:turn1checker/components/ui/dialogs/primary_simple_dialog.dart';
import 'package:turn1checker/components/ui/inputs/primary_text_field.dart';
import 'package:turn1checker/viewmodel/deckList/deckList.dart';
import '../../i18n/i18n.g.dart';
import '../../utils/validations/decks.dart';

class DeckNameModal extends ConsumerWidget {
  const DeckNameModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    final decksNotifier = ref.watch(deckListNotifierProvider.notifier);
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
                  final deck = decksNotifier
                      .createDeck(formKey.currentState!.value['deckName']);
                  context.push('/edit/${deck.id}');
                }
              },
              text: t.text.register)
        ],
      ),
    );
  }
}
