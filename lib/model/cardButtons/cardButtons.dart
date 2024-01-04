import 'package:realm/realm.dart';
part 'cardButtons.g.dart';

@RealmModel()
class $CardButtons {
  @PrimaryKey()
  late ObjectId id;
  late $CardType? type;
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
  late int order;
  late DateTime createdAt;
  late DateTime updatedAt;
}

@RealmModel()
class $CardType {
  @PrimaryKey()
  late int id;
  late String name;
  late int color;
  late DateTime createdAt;
  late DateTime updatedAt;
}
