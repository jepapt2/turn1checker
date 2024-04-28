import 'package:realm/realm.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/model/realm.dart';

class CardHooks {
  CardButtons? getCard(ObjectId id) {
    final card = realm.find<CardButtons>(id);
    return card;
  }

  List<CardButtons> getCardList() {
    final cards =
        realm.query<CardButtons>('TRUEPREDICATE SORT(updatedAt DESC)');
    return cards.toList();
  }

  CardButtons createCard(CardButtons card) {
    realm.write(() {
      realm.add<CardButtons>(card);
    });
    return card;
  }

  deleteCard(CardButtons card) {
    realm.write(() {
      realm.delete(card);
    });
  }
}
