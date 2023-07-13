//ルーター
import 'package:go_router/go_router.dart';
import 'package:turn1checker/screens/decklist.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const DeckListScreen(),
  )
]);
