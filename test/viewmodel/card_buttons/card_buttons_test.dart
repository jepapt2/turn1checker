import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/card_type.dart';
import 'package:turn1checker/types/counterState/counterState.dart';
import 'package:turn1checker/viewmodel/card_buttons/card_buttons.dart';

void main() {
  group('CardButtonsNotifier Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態のテスト', () {
      final notifier = container.read(cardButtonsNotifierProvider(
        initialCardState: null,
      ).notifier);

      expect(notifier.state.name, '');
      expect(notifier.state.type, CardType.monster);
      expect(notifier.state.buttonWithOrderState, []);
    });

    test('updateメソッドのテスト', () {
      final notifier = container.read(cardButtonsNotifierProvider(
        initialCardState: null,
      ).notifier);

      notifier.update((state) => state.copyWith(name: 'テストカード'));
      expect(notifier.state.name, 'テストカード');
    });

    test('エフェクトボタンの操作テスト', () {
      final effectButton = EffectCheckButtonState(
        description: 'テストエフェクト',
        limitPeriod: EffectLimitPeriod.turn,
        count: 0,
        limit: 2,
      );

      final buttonWithOrder = EffectCheckButtonWithOrderState(
        0,
        effectButton,
      );

      final initialState = CardButtonState(
        id: ObjectId(),
        name: 'テストカード',
        type: CardType.monster,
        buttonWithOrderState: [buttonWithOrder],
      );

      final notifier = container.read(cardButtonsNotifierProvider(
        initialCardState: initialState,
      ).notifier);

      // pressEffectCheckButtonのテスト
      notifier.pressEffectCheckButton(0);
      expect(
        (notifier.state.buttonWithOrderState[0]
                as EffectCheckButtonWithOrderState)
            .effectButton
            .count,
        1,
      );

      // resetEffectCheckButtonのテスト
      notifier.resetEffectCheckButton(0);
      expect(
        (notifier.state.buttonWithOrderState[0]
                as EffectCheckButtonWithOrderState)
            .effectButton
            .count,
        0,
      );
    });

    test('カウンターボタンの操作テスト', () {
      final counterButton = CounterState(
        value: 0,
        initialValue: 0,
        buttons: [1, -1],
      );

      final buttonWithOrder = CounterButtonWithOrderState(
        0,
        counterButton,
      );

      final initialState = CardButtonState(
        id: ObjectId(),
        name: 'テストカード',
        type: CardType.monster,
        buttonWithOrderState: [buttonWithOrder],
      );

      final notifier = container.read(cardButtonsNotifierProvider(
        initialCardState: initialState,
      ).notifier);

      // pressCounterButtonのテスト
      notifier.pressCounterButton(0, 1);
      expect(
        (notifier.state.buttonWithOrderState[0] as CounterButtonWithOrderState)
            .counterButton
            .value,
        1,
      );

      // resetCounterButtonのテスト
      notifier.resetCounterButton(0);
      expect(
        (notifier.state.buttonWithOrderState[0] as CounterButtonWithOrderState)
            .counterButton
            .value,
        0,
      );
    });
  });
}
