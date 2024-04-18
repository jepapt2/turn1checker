import 'package:realm/realm.dart';

import '../cardButtons/card_buttons.dart';
part 'deck.g.dart';

@RealmModel()
class $Deck {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late List<$CardButtons> cards;
  late $CardsOrder? cardsOrder;
  late DateTime createdAt;
  late DateTime updatedAt;
}

@RealmModel()
class $CardsOrder {
  @PrimaryKey()
  late ObjectId id;
  late String order;
  late DateTime createdAt;
  late DateTime updatedAt;
}
