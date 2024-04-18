import 'package:turn1checker/i18n/i18n.g.dart';

enum CardType {
  monster(order: 1, color: 0xFFED8B31),
  ritualMonster(order: 1, color: 0xFF65DED7),
  spell(order: 3, color: 0xFF42C82C),
  trap(order: 4, color: 0xFFD650A8),
  fusionMonster(order: 5, color: 0xFF6F07AF),
  synchroMonster(order: 6, color: 0xFFFBFBFB),
  xyzMonster(order: 7, color: 0xFF363636),
  linkMonster(order: 8, color: 0xFF2115B0),
  ;

  final int order;
  final int color;
  const CardType({required this.order, required this.color});

  @override
  String toString() {
    switch (this) {
      case CardType.monster:
        return t.text.monster;
      case CardType.ritualMonster:
        return t.text.ritualMonster;
      case CardType.spell:
        return t.text.spell;
      case CardType.trap:
        return t.text.trap;
      case CardType.fusionMonster:
        return t.text.fusionMonster;
      case CardType.synchroMonster:
        return t.text.synchroMonster;
      case CardType.xyzMonster:
        return t.text.xyzMonster;
      case CardType.linkMonster:
        return t.text.linkMonster;
    }
  }
}
