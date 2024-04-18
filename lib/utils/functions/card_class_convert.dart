import 'package:realm/realm.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/model/counter/counter.dart';
import 'package:turn1checker/model/effectCheckButton/effect_check_button.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';

CardButtons cardButtonsConvertStateToDb(
    {required CardButtonState state, required ObjectId id, String? imageName}) {
  final effectCheckButtons = state.buttonWithOrderState
      .map((e) {
        if (e is EffectCheckButtonWithOrderState) {
          final button = e.effectButton;
          return EffectCheckButton(ObjectId(), button.description, button.limit,
              button.limitPeriod.name, e.order);
        }
      })
      .whereType<EffectCheckButton>()
      .toList();
  final counters = state.buttonWithOrderState
      .map((e) {
        if (e is CounterButtonWithOrderState) {
          final counter = e.counterButton;
          return Counter(ObjectId(), counter.initialValue, e.order,
              buttonsValue: counter.buttons);
        }
      })
      .whereType<Counter>()
      .toList();
  return CardButtons(
    id,
    state.type.name,
    state.name,
    image: imageName,
    effectCheckButtons: effectCheckButtons,
    counters: counters,
    DateTime.now(),
    DateTime.now(),
  );
}
