import 'package:realm/realm.dart';
import 'package:turn1checker/model/card/card.dart';
part 'counter.g.dart';

@RealmModel()
class $Counter {
  @PrimaryKey()
  late ObjectId id;
  late int initialValue;
  late List<$CounterButton> buttons;
  late $ButtonsOrder? order;
  late DateTime createdAt;
  late DateTime updatedAt;
}

@RealmModel()
class $CounterButton {
  @PrimaryKey()
  late ObjectId id;
  late int value;
  late bool isIncrement;
  late DateTime createdAt;
  late DateTime updatedAt;
}
