//ルーター
import 'package:go_router/go_router.dart';
import 'package:turn1checker/screens/camera.dart';
import 'package:turn1checker/screens/deck.dart';
import 'package:turn1checker/screens/deck_edit.dart';
import 'package:turn1checker/screens/deckList.dart';
import 'package:turn1checker/screens/card_edit.dart';
import 'package:turn1checker/screens/upgrade.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (context, state) => const DeckListScreen(),
      routes: [
        GoRoute(
          path: 'deck/:id',
          builder: (context, state) => DeckScreen(id: state.params['id']),
        ),
        GoRoute(
          path: 'edit/:id',
          builder: (context, state) => DeckEditScreen(id: state.params['id']),
          routes: [
            GoRoute(
              path: 'card/new',
              builder: (context, state) => CardEditScreen(
                deckId: state.params['id'],
              ),
            ),
            GoRoute(
              path: 'card/:cardId',
              builder: (context, state) => CardEditScreen(
                deckId: state.params['id'],
                cardId: state.params['cardId'],
              ),
            ),
          ],
        ),
        GoRoute(
            path: 'camera', builder: (context, state) => const CameraScreen()),
        GoRoute(
            path: 'upgrade',
            builder: (context, state) => const UpgradeScreen()),
      ]),
]);
