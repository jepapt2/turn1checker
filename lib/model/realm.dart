import 'package:realm/realm.dart';
import 'package:turn1checker/model/cardButtons/cardButtons.dart';
import 'package:turn1checker/model/counter/counter.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/model/effectCheckButton/effectCheckButton.dart';

initialdata(Realm realm) {
  // realm.add(Car(
  //   ObjectId(),
  //   'Ford',
  //   model: 'Fiesta',
  //   miles: 11000,
  // ));
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
