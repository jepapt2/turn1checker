import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/model/cardButtons/cardButtons.dart';

final initialCardType = [
  CardType(1, t.text.monster, 0xFFED8B31, DateTime.now(), DateTime.now()),
  CardType(
      30, t.text.ritualMonster, 0xFF65DED7, DateTime.now(), DateTime.now()),
  CardType(50, t.text.spell, 0xFF42C82C, DateTime.now(), DateTime.now()),
  CardType(60, t.text.trap, 0xFFD650A8, DateTime.now(), DateTime.now()),
  CardType(
      100, t.text.fusionMonster, 0xFF6F07AF, DateTime.now(), DateTime.now()),
  CardType(
      110, t.text.synchroMonster, 0xFFFBFBFB, DateTime.now(), DateTime.now()),
  CardType(120, t.text.xyzMonster, 0xFF363636, DateTime.now(), DateTime.now()),
  CardType(130, t.text.linkMonster, 0xFF2115B0, DateTime.now(), DateTime.now()),
];
