import 'package:realm/realm.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
part 'counter.g.dart';

@RealmModel()
class $Counter {
  @PrimaryKey()
  late ObjectId id;
  late int initialValue;
  late List<int> buttonsValue;
  late int order;
}
