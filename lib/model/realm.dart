import 'package:realm/realm.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/model/cardButtons/cardButtons.dart';
import 'package:turn1checker/model/counter/counter.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/model/effectCheckButton/effectCheckButton.dart';
import 'package:turn1checker/resource/initial_card_type.dart';

initialdata(Realm realm) {
  realm.addAll(initialCardType);
}

final config = Configuration.local(
  [
    CardButtons.schema,
    CardType.schema,
    Deck.schema,
    CardsOrder.schema,
    ButtonsOrder.schema,
    Counter.schema,
    CounterButton.schema,
    EffectCheckButton.schema,
  ],
  schemaVersion: 2,
  initialDataCallback: initialdata,
);

final realm = Realm(config);
