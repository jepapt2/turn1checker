//ルーター
import 'package:go_router/go_router.dart';
import 'package:turn1checker/screens/camera.dart';
import 'package:turn1checker/screens/deckEdit.dart';
import 'package:turn1checker/screens/deckList.dart';
import 'package:turn1checker/screens/cardEdit.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (context, state) => const DeckListScreen(),
      routes: [
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
            // GoRoute(
            //   path: '/card/:cardId',
            //   builder: (context, state) => CardEditScreen(
            //     deckId: state.params['id'],
            //     cardId: state.params['cardId'],
            //   ),
            // ),
          ],
        ),
        GoRoute(
            path: 'camera', builder: (context, state) => const CameraScreen())
      ]),
]);
