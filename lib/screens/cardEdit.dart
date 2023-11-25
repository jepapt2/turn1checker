import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/components/card/cardButtonsWidget.dart';
import 'package:turn1checker/components/deck/decklist_tile.dart';
import 'package:turn1checker/components/deck/deckname_modal.dart';
import 'package:turn1checker/components/ui/buttons/primary_floating_action_button.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/model/cardButtons/cardButtons.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/utils/functions/cardAspectRatio.dart';
import 'package:turn1checker/utils/functions/getObjectId.dart';

import 'package:turn1checker/utils/validations/decks.dart';
import 'package:turn1checker/viewmodel/deckEdit/deckEdit.dart';
import '../i18n/i18n.g.dart';

class CardEditScreen extends HookConsumerWidget {
  const CardEditScreen({Key? key, this.deckId, this.cardId}) : super(key: key);

  final String? deckId;
  final String? cardId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //gorouterで現在のルートを取得

    final Deck deck = ref.watch(deckEditNotifierProvider(getObjectId(deckId)));
    final double mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(t.text.cardEdit),
          actions: [],
        ),
        body: Column(
          children: [
            Container(
              color: ColorTheme.black,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: Text('a'))),
              ),
            ),
            const Expanded(child: SingleChildScrollView(child: SizedBox())),
          ],
        ));
  }
}
