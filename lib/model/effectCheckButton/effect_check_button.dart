import 'package:realm/realm.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/model/counter/counter.dart';

part 'effect_check_button.g.dart';

@RealmModel()
class $EffectCheckButton {
  @PrimaryKey()
  late ObjectId id;
  late String description;
  late int limit;
  late String period;
  late int order;
}
