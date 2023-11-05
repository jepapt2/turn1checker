//ルーター
import 'package:go_router/go_router.dart';
import 'package:turn1checker/screens/deckEdit.dart';
import 'package:turn1checker/screens/deckList.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const DeckListScreen(),
  ),
  GoRoute(
      path: '/edit/:id',
      builder: (context, state) => DeckEditScreen(id: state.params['id']))
]);
