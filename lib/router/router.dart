//ルーター
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turn1checker/screens/camera.dart';
import 'package:turn1checker/screens/deck.dart';
import 'package:turn1checker/screens/deck_edit.dart';
import 'package:turn1checker/screens/deckList.dart';
import 'package:turn1checker/screens/card_edit.dart';
import 'package:turn1checker/screens/upgrade.dart';

GoRouter router({required List<NavigatorObserver>? observers}) =>
    GoRouter(routes: <RouteBase>[
      GoRoute(
          path: '/',
          name: 'deckList',
          builder: (context, state) => const DeckListScreen(),
          routes: [
            GoRoute(
              path: 'deck/:id',
              name: 'deck',
              builder: (context, state) => DeckScreen(id: state.params['id']),
            ),
            GoRoute(
              path: 'edit/:id',
              name: 'deckEdit',
              builder: (context, state) =>
                  DeckEditScreen(id: state.params['id']),
              routes: [
                GoRoute(
                  path: 'card/new',
                  name: 'cardNew',
                  builder: (context, state) => CardEditScreen(
                    deckId: state.params['id'],
                  ),
                ),
                GoRoute(
                  path: 'card/:cardId',
                  name: 'cardEdit',
                  builder: (context, state) => CardEditScreen(
                    deckId: state.params['id'],
                    cardId: state.params['cardId'],
                  ),
                ),
              ],
            ),
            GoRoute(
                path: 'camera',
                name: 'camera',
                builder: (context, state) => const CameraScreen()),
            GoRoute(
                path: 'upgrade',
                name: 'upgrade',
                builder: (context, state) => const UpgradeScreen()),
          ]),
    ], observers: observers);
