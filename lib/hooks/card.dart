import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/model/realm.dart';

class CardHooks {
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
}
