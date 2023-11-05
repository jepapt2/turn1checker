// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:turn1checker/components/deck/decklist_tile.dart';
// import 'package:turn1checker/components/deck/deckname_modal.dart';
// import 'package:turn1checker/components/ui/primary_button.dart';
// import 'package:turn1checker/components/ui/primary_floating_action_button.dart';
// import 'package:turn1checker/components/ui/primary_text_field.dart';
// import 'package:turn1checker/hooks/decks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:turn1checker/model/db/db.dart';
// import 'package:turn1checker/utils/validations/decks.dart';
// import 'package:turn1checker/viewmodel/deck_list.dart';
// import '../components/ui/cyan_gradient_button.dart';
// import '../components/ui/primary_simple_dialog.dart';
// import '../i18n/i18n.g.dart';

// class DeckEditScreen extends HookConsumerWidget {
//   const DeckEditScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<List<Deck>> decks = ref.watch(deckListProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(t.text.deckList),
//         actions: [
//           IconButton(
//               onPressed: () => showDeckAddDialog(context: context),
//               icon: const Icon(
//                 Icons.add,
//                 size: 28,
//                 color: Colors.white,
//               ))
//         ],
//       ),
//       body: Container(
//         child: decks.when(
//           data: (decks) => Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
//             child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 12.0),
//                     child: DeckListTile(
//                       deck: decks[index],
//                     ),
//                   );
//                 },
//                 itemCount: decks.length),
//           ),
//           loading: () => const Center(child: CircularProgressIndicator()),
//           error: (error, stackTrace) => Center(
//             child: Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Text(t.text.deckListAsyncError),
//                   ),
//                   PrimaryButton(
//                     onPressed: () => ref.refresh(deckListProvider),
//                     text: t.text.reload,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// showDeckAddDialog({required BuildContext context}) {
//   showDialog(
//     context: context,
//     builder: (BuildContext dialogContext) => const DeckNameModal(),
//   );
// }
