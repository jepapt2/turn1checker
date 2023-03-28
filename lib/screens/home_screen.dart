import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:turn1checker/components/ui/primary_floating_action_button.dart';

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
        child: Text(''),
      ),
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
      return PrimarySimpleModal(
        title: Text(appLocalizations.registerDeckName),
        child: Text('aaaaaa'),
      );
    },
  );
}
