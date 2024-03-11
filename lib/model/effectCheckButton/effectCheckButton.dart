import 'package:realm/realm.dart';
import 'package:turn1checker/model/cardButtons/cardButtons.dart';
import 'package:turn1checker/model/counter/counter.dart';

part 'effectCheckButton.g.dart';

@RealmModel()
class $EffectCheckButton {
  @PrimaryKey()
  late ObjectId id;
  late String description;
  late int limit;
  late String period;
  late DateTime createdAt;
  late DateTime updatedAt;
  late $ButtonsOrder? order;
}
