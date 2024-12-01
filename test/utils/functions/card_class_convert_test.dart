import 'package:flutter_test/flutter_test.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/model/effectCheckButton/effect_check_button.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/card_type.dart';
import 'package:turn1checker/types/counterState/counterState.dart';
import 'package:turn1checker/utils/functions/card_class_convert.dart';

void main() {
  group('Card Class Convert Tests', () {
    CardButtonState testCard(List<ButtonWithOrderState> buttonWithOrderState) {
      final initialState = CardButtonState(
        id: ObjectId(),
        name: 'Test Card',
        image: 'testImage.png',
        type: CardType.monster,
        buttonWithOrderState: buttonWithOrderState,
      );

      return initialState.copyWith(
        buttonWithOrderState: buttonWithOrderState,
      );
    }

    test('カードボタンの状態をデータベースモデルに変換', () {
      final state = testCard([
        EffectCheckButtonWithOrderState(
          1,
          const EffectCheckButtonState(
            description: 'test',
            count: 1,
            limit: 1,
          ),
        ),
        CounterButtonWithOrderState(
          2,
          const CounterState(
            initialValue: 0,
            value: 0,
            buttons: [1, -1],
          ),
        ),
        EffectCheckButtonWithOrderState(
          3,
          const EffectCheckButtonState(
            description: 'testtesttesttesttesttest',
            count: 1,
            limit: 4,
            limitPeriod: EffectLimitPeriod.duel,
          ),
        ),
      ]);

      // Act
      final result = cardButtonsConvertStateToDb(state: state);

      // Assert
      expect(result.id, state.id);
      expect(result.name, state.name);
      expect(result.image, state.image);
      expect(result.type, state.type.name);
      // Add more assertions as needed
    });

    test('不正なボタン順序で例外をスローする', () {
      final state = testCard(
        [
          // 不正な順序設定
          EffectCheckButtonWithOrderState(
              2,
              const EffectCheckButtonState(
                  description: 'desc',
                  count: 0,
                  limit: 1,
                  limitPeriod: EffectLimitPeriod.turn)),
          EffectCheckButtonWithOrderState(
              1,
              const EffectCheckButtonState(
                  description: 'desc',
                  count: 0,
                  limit: 1,
                  limitPeriod: EffectLimitPeriod.turn)),
        ],
      );

      expect(
        () => cardButtonsConvertStateToDb(state: state),
        throwsA(isA<Exception>()
            .having((e) => e.toString(), 'message', contains('ボタンの順序番号が不正です'))),
      );
    });

    test('不正なボタン数で例外をスローする', () {
      final state = testCard(
        [
          // 4以上のボタン
          EffectCheckButtonWithOrderState(
              1,
              const EffectCheckButtonState(
                  description: 'desc',
                  count: 0,
                  limit: 1,
                  limitPeriod: EffectLimitPeriod.turn)),
          EffectCheckButtonWithOrderState(
              2,
              const EffectCheckButtonState(
                  description: 'desc',
                  count: 0,
                  limit: 1,
                  limitPeriod: EffectLimitPeriod.turn)),
          EffectCheckButtonWithOrderState(
              3,
              const EffectCheckButtonState(
                  description: 'desc',
                  count: 0,
                  limit: 1,
                  limitPeriod: EffectLimitPeriod.turn)),
          EffectCheckButtonWithOrderState(
              4,
              const EffectCheckButtonState(
                  description: 'desc',
                  count: 0,
                  limit: 1,
                  limitPeriod: EffectLimitPeriod.turn)),
        ],
      );

      expect(
        () => cardButtonsConvertStateToDb(state: state),
        throwsA(isA<Exception>()
            .having((e) => e.toString(), 'message', contains('ボタンの数が不正です'))),
      );
    });

    test('不正なカウンターボタン数で例外をスローする', () {
      final state = testCard(
        [
          CounterButtonWithOrderState(
              1,
              const CounterState(
                  value: 0, initialValue: 0, buttons: [1, 2, -3])),
        ],
      );

      expect(
        () => cardButtonsConvertStateToDb(state: state),
        throwsA(isA<Exception>().having(
            (e) => e.toString(), 'message', contains('カウンターボタンの数が不正です'))),
      );
    });
  });

  test('データベースモデルをカードボタンの状態に変換', () {
    // Arrange
    final cardButtons = CardButtons(
      ObjectId(),
      'monster',
      'testMonster',
      DateTime.now(),
      DateTime.now(),
      effectCheckButtons: [],
      counters: [],
    );

    // Act
    final result = cardButtonsConvertDbToState(cardButtons);

    // Assert
    expect(result.id, cardButtons.id);
    expect(result.name, cardButtons.name);
    expect(result.image, cardButtons.image);
    expect(result.type.name, cardButtons.type);
    // Add more assertions as needed
  });

  group('cardButtonsConvertDbToState conversion tests', () {
    test('無効なカードタイプの場合、例外をスローすること', () {
      final cardButtons = CardButtons(
        ObjectId(),
        'invalid_type', // 無効なカードタイプ
        'testCard',
        DateTime.now(),
        DateTime.now(),
        effectCheckButtons: [],
        counters: [],
      );

      expect(
        () => cardButtonsConvertDbToState(cardButtons),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('無効なカードタイプ: invalid_type'),
        )),
      );
    });

    test('無効な期間の場合、例外をスローすること', () {
      final cardButtons = CardButtons(
        ObjectId(),
        'monster',
        'testCard',
        DateTime.now(),
        DateTime.now(),
        effectCheckButtons: [
          EffectCheckButton(
            ObjectId(),
            'テスト効果',
            1,
            'invalid_period', // 無効な期間
            1,
          ),
        ],
        counters: [],
      );

      expect(
        () => cardButtonsConvertDbToState(cardButtons),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('無効な期間: invalid_period'),
        )),
      );
    });

    test('正常な値の場合、変換が成功すること', () {
      final cardButtons = CardButtons(
        ObjectId(),
        'monster',
        'testCard',
        DateTime.now(),
        DateTime.now(),
        effectCheckButtons: [
          EffectCheckButton(
            ObjectId(),
            'テスト効果',
            1,
            'turn', // 有効な期間
            1,
          ),
        ],
        counters: [],
      );

      expect(
        () => cardButtonsConvertDbToState(cardButtons),
        isNot(throwsException),
      );
    });
  });
}
