import 'package:realm/realm.dart';
import 'package:turn1checker/model/counter/counter.dart';
import 'package:turn1checker/model/effectCheckButton/effect_check_button.dart';
part 'card_buttons.g.dart';

@RealmModel()
class $CardButtons {
  @PrimaryKey()
  late ObjectId id;
  late String type;
  late String name;
  late String? image;
  late List<$Counter> counters;
  late List<$EffectCheckButton> effectCheckButtons;
  late DateTime createdAt;
  late DateTime updatedAt;
}
