import 'package:realm/realm.dart';
part 'card.g.dart';

@RealmModel()
class $Card {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String image;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int order;
}

@RealmModel()
class $ButtonsOrder {
  @PrimaryKey()
  late ObjectId id;
  late String order;
  late DateTime createdAt;
  late DateTime updatedAt;
}

@RealmModel()
class $CardType {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String color;
  late DateTime createdAt;
  late DateTime updatedAt;
}
