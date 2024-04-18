import 'package:realm/realm.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/model/counter/counter.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/model/effectCheckButton/effect_check_button.dart';

final config = Configuration.local(
  [
    CardButtons.schema,
    Deck.schema,
    CardsOrder.schema,
    Counter.schema,
    EffectCheckButton.schema,
  ],
  schemaVersion: 2,
);

final realm = Realm(config);
