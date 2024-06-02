/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 138 (69 per locale)
///
/// Built on 2024-06-02 at 09:46 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ja;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ja) // set locale
/// - Locale locale = AppLocale.ja.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ja) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _I18nJa> {
	ja(languageCode: 'ja', build: _I18nJa.build),
	en(languageCode: 'en', build: _I18nEn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _I18nJa> build;

	/// Gets current instance managed by [LocaleSettings].
	_I18nJa get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_I18nJa get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _I18nJa of(BuildContext context) => InheritedLocaleData.of<AppLocale, _I18nJa>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _I18nJa> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _I18nJa> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _I18nJa>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_I18nJa get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _I18nJa> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _I18nJa> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _I18nJa implements BaseTranslations<AppLocale, _I18nJa> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_I18nJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, _I18nJa> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _I18nJa _root = this; // ignore: unused_field

	// Translations
	late final _I18nTextJa text = _I18nTextJa._(_root);
}

// Path: text
class _I18nTextJa {
	_I18nTextJa._(this._root);

	final _I18nJa _root; // ignore: unused_field

	// Translations
	String get deckList => 'デッキリスト';
	String get deckName => 'デッキ名';
	String get reload => '再読み込み';
	String get deckNameRequiredError => 'デッキ名を入力してください';
	String deckNameMinLengthError({required Object length}) => 'デッキ名は${length}文字以上で入力してください';
	String deckNameMaxLengthError({required Object length}) => 'デッキ名は${length}文字以内で入力してください';
	String get deckListAsyncError => 'デッキリストの取得に失敗しました';
	String get cardEdit => 'カード編集';
	String get register => '登録';
	String get name => '名前';
	String get counter => 'カウンター';
	String get monster => 'モンスター';
	String get ritualMonster => '儀式モンスター';
	String get fusionMonster => '融合モンスター';
	String get synchroMonster => 'シンクロモンスター';
	String get xyzMonster => 'エクシーズモンスター';
	String get pendulumMonster => 'ペンデュラムモンスター';
	String get linkMonster => 'リンクモンスター';
	String get spell => '魔法';
	String get trap => '罠';
	String get cardType => 'カードの種類';
	String get illustration => 'イラスト';
	String get cropIluustration => 'イラストの切り抜き';
	String get cameraDescription => '枠内にイラストを収めて撮影してください';
	String get camera => 'カメラ';
	String get illustrationSetting => 'イラストの設定';
	String get illustrationConfirm => 'この画像を登録しますか？';
	String get yes => 'はい';
	String get cancel => 'キャンセル';
	String get turn => 'ターン';
	String get duel => 'デュエル';
	String get numberOfTimes => '回数';
	String get effectDescription => '効果説明';
	String get initialValue => '初期値';
	String get button => 'ボタン';
	String get save => '保存';
	String get imageSaveError => '画像の保存に失敗しました';
	String get cardSaveError => 'カードの保存に失敗しました';
	String get sortCardType => 'カードの種類で整列';
	String get manualSort => '手動で並び替え';
	String get registerDeckNameDialogTitle => 'デッキ名の登録';
	String get changeDeckNameDialogTitle => 'デッキ名の変更';
	String get changeDeckName => 'デッキ名を変更';
	String get deleteDeck => 'デッキを削除';
	String get deleteDeckConfirm => 'このデッキを削除しますか?';
	String get buttonsLengthVaridateError => 'ボタンまたはカウンターを1つ以上登録してください';
	String get closeDeckScreenConfirm => 'デュエルを終了しますか？';
	String get selectFromCamera => 'カメラから選択';
	String get selectFromGallery => 'ギャラリーから選択';
	String get addButton => 'ボタンを追加';
	String get addCounter => 'カウンターを追加';
	String get deckSlot5 => 'デッキ作成枠+5';
	String get removeAds => '広告を非表示';
	String get deckSlot3 => 'デッキ作成枠+3';
	String get faildGetPurchaseItem => '購入アイテムの取得に失敗しました。';
	String get faildPurchase => '購入に失敗しました';
	String get upgrade => 'アップグレード';
	String get thankYou => 'ありがとうございます！';
	String get deckSlot5PurchaseSuccess => 'デッキ作成枠+5の購入が完了しました。';
	String get removeAdsPurchaseSuccess => '広告非表示の購入が完了しました。';
	String get canceledPurchase => '購入がキャンセルされました。';
	String get restore => '購入情報の復元';
	String get restoreSuccess => '購入情報の復元が完了しました。';
	String get restoreFailed => '購入情報の復元に失敗しました。';
	String get withDeckSlot3 => 'デッキ作成枠+3付き';
	String get existPurchase => '購入済み';
	String get confirm => '確認';
	String get multipleAdsPurchase => '広告非表示の複数購入が確認されました。\n購入金額分のデッキ枠、+10に変換されます。';
	String get currentDeckSlot => '現在のデッキ枠';
}

// Path: <root>
class _I18nEn implements _I18nJa {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_I18nEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _I18nJa> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _I18nEn _root = this; // ignore: unused_field

	// Translations
	@override late final _I18nTextEn text = _I18nTextEn._(_root);
}

// Path: text
class _I18nTextEn implements _I18nTextJa {
	_I18nTextEn._(this._root);

	@override final _I18nEn _root; // ignore: unused_field

	// Translations
	@override String get deckList => 'DeckList';
	@override String get deckName => 'DeckName';
	@override String get reload => 'Reload';
	@override String get deckNameRequiredError => 'Please enter a deck name.';
	@override String deckNameMinLengthError({required Object length}) => 'Deck name must be at least ${length} characters.';
	@override String deckNameMaxLengthError({required Object length}) => 'Deck name must be ${length} characters or less.';
	@override String get deckListAsyncError => 'An error occurred while getting the deck list.';
	@override String get cardEdit => 'CardEdit';
	@override String get register => 'Register';
	@override String get name => 'Name';
	@override String get counter => 'Counter';
	@override String get monster => 'Monster';
	@override String get ritualMonster => 'RitualMonster';
	@override String get fusionMonster => 'FusionMonster';
	@override String get synchroMonster => 'SynchroMonster';
	@override String get xyzMonster => 'XyzMonster';
	@override String get pendulumMonster => 'PendulumMonster';
	@override String get linkMonster => 'LinkMonster';
	@override String get spell => 'Spell';
	@override String get trap => 'Trap';
	@override String get cardType => 'CardType';
	@override String get illustration => 'Illustration';
	@override String get cropIluustration => 'CropIllustration';
	@override String get cameraDescription => 'Please take a picture of the illustration within the frame.';
	@override String get camera => 'Camera';
	@override String get illustrationSetting => 'IllustrationSetting';
	@override String get illustrationConfirm => 'register this image?';
	@override String get yes => 'Yes';
	@override String get cancel => 'Cancel';
	@override String get turn => 'Turn';
	@override String get duel => 'duel';
	@override String get numberOfTimes => 'NumberOfTimes';
	@override String get effectDescription => 'EffectDescription';
	@override String get initialValue => 'InitialValue';
	@override String get button => 'Button';
	@override String get save => 'Save';
	@override String get imageSaveError => 'Failed to save the image.';
	@override String get cardSaveError => 'Failed to save the card.';
	@override String get sortCardType => 'Sort by card type';
	@override String get manualSort => 'Manual sorting';
	@override String get registerDeckNameDialogTitle => 'Register Deckname';
	@override String get changeDeckNameDialogTitle => 'Change Deckname';
	@override String get changeDeckName => 'Change Deckname';
	@override String get deleteDeck => 'Delete Deck';
	@override String get deleteDeckConfirm => 'Do you want to remove this Deck?';
	@override String get buttonsLengthVaridateError => 'Register one or more buttons or counters.';
	@override String get closeDeckScreenConfirm => 'Do you want to end the duel?';
	@override String get selectFromCamera => 'Select from camera';
	@override String get selectFromGallery => 'Select from gallery';
	@override String get addButton => 'Add button';
	@override String get addCounter => 'Add counter';
	@override String get deckSlot5 => 'Deck Slot +5';
	@override String get removeAds => 'Remove Ads';
	@override String get deckSlot3 => 'Deck Slot +3';
	@override String get faildGetPurchaseItem => 'Failed to get purchase item.';
	@override String get faildPurchase => 'Failed to purchase.';
	@override String get upgrade => 'Upgrade';
	@override String get thankYou => 'Thank you!';
	@override String get deckSlot5PurchaseSuccess => 'Deck Slot +5 purchase completed.';
	@override String get removeAdsPurchaseSuccess => 'Remove Ads purchase completed.';
	@override String get canceledPurchase => 'The purchase was canceled.';
	@override String get restore => 'Restore purchases infomation.';
	@override String get restoreSuccess => 'Restore purchases infomation completed.';
	@override String get restoreFailed => 'Failed to restore purchases infomation.';
	@override String get withDeckSlot3 => 'With Deck Slot +3';
	@override String get existPurchase => 'Already purchased.';
	@override String get confirm => 'Confirm';
	@override String get multipleAdsPurchase => 'Multiple ad-free purchases were identified.\nDeck slots for the amount purchased converted to +10.';
	@override String get currentDeckSlot => 'Current deck slot';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _I18nJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'text.deckList': return 'デッキリスト';
			case 'text.deckName': return 'デッキ名';
			case 'text.reload': return '再読み込み';
			case 'text.deckNameRequiredError': return 'デッキ名を入力してください';
			case 'text.deckNameMinLengthError': return ({required Object length}) => 'デッキ名は${length}文字以上で入力してください';
			case 'text.deckNameMaxLengthError': return ({required Object length}) => 'デッキ名は${length}文字以内で入力してください';
			case 'text.deckListAsyncError': return 'デッキリストの取得に失敗しました';
			case 'text.cardEdit': return 'カード編集';
			case 'text.register': return '登録';
			case 'text.name': return '名前';
			case 'text.counter': return 'カウンター';
			case 'text.monster': return 'モンスター';
			case 'text.ritualMonster': return '儀式モンスター';
			case 'text.fusionMonster': return '融合モンスター';
			case 'text.synchroMonster': return 'シンクロモンスター';
			case 'text.xyzMonster': return 'エクシーズモンスター';
			case 'text.pendulumMonster': return 'ペンデュラムモンスター';
			case 'text.linkMonster': return 'リンクモンスター';
			case 'text.spell': return '魔法';
			case 'text.trap': return '罠';
			case 'text.cardType': return 'カードの種類';
			case 'text.illustration': return 'イラスト';
			case 'text.cropIluustration': return 'イラストの切り抜き';
			case 'text.cameraDescription': return '枠内にイラストを収めて撮影してください';
			case 'text.camera': return 'カメラ';
			case 'text.illustrationSetting': return 'イラストの設定';
			case 'text.illustrationConfirm': return 'この画像を登録しますか？';
			case 'text.yes': return 'はい';
			case 'text.cancel': return 'キャンセル';
			case 'text.turn': return 'ターン';
			case 'text.duel': return 'デュエル';
			case 'text.numberOfTimes': return '回数';
			case 'text.effectDescription': return '効果説明';
			case 'text.initialValue': return '初期値';
			case 'text.button': return 'ボタン';
			case 'text.save': return '保存';
			case 'text.imageSaveError': return '画像の保存に失敗しました';
			case 'text.cardSaveError': return 'カードの保存に失敗しました';
			case 'text.sortCardType': return 'カードの種類で整列';
			case 'text.manualSort': return '手動で並び替え';
			case 'text.registerDeckNameDialogTitle': return 'デッキ名の登録';
			case 'text.changeDeckNameDialogTitle': return 'デッキ名の変更';
			case 'text.changeDeckName': return 'デッキ名を変更';
			case 'text.deleteDeck': return 'デッキを削除';
			case 'text.deleteDeckConfirm': return 'このデッキを削除しますか?';
			case 'text.buttonsLengthVaridateError': return 'ボタンまたはカウンターを1つ以上登録してください';
			case 'text.closeDeckScreenConfirm': return 'デュエルを終了しますか？';
			case 'text.selectFromCamera': return 'カメラから選択';
			case 'text.selectFromGallery': return 'ギャラリーから選択';
			case 'text.addButton': return 'ボタンを追加';
			case 'text.addCounter': return 'カウンターを追加';
			case 'text.deckSlot5': return 'デッキ作成枠+5';
			case 'text.removeAds': return '広告を非表示';
			case 'text.deckSlot3': return 'デッキ作成枠+3';
			case 'text.faildGetPurchaseItem': return '購入アイテムの取得に失敗しました。';
			case 'text.faildPurchase': return '購入に失敗しました';
			case 'text.upgrade': return 'アップグレード';
			case 'text.thankYou': return 'ありがとうございます！';
			case 'text.deckSlot5PurchaseSuccess': return 'デッキ作成枠+5の購入が完了しました。';
			case 'text.removeAdsPurchaseSuccess': return '広告非表示の購入が完了しました。';
			case 'text.canceledPurchase': return '購入がキャンセルされました。';
			case 'text.restore': return '購入情報の復元';
			case 'text.restoreSuccess': return '購入情報の復元が完了しました。';
			case 'text.restoreFailed': return '購入情報の復元に失敗しました。';
			case 'text.withDeckSlot3': return 'デッキ作成枠+3付き';
			case 'text.existPurchase': return '購入済み';
			case 'text.confirm': return '確認';
			case 'text.multipleAdsPurchase': return '広告非表示の複数購入が確認されました。\n購入金額分のデッキ枠、+10に変換されます。';
			case 'text.currentDeckSlot': return '現在のデッキ枠';
			default: return null;
		}
	}
}

extension on _I18nEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'text.deckList': return 'DeckList';
			case 'text.deckName': return 'DeckName';
			case 'text.reload': return 'Reload';
			case 'text.deckNameRequiredError': return 'Please enter a deck name.';
			case 'text.deckNameMinLengthError': return ({required Object length}) => 'Deck name must be at least ${length} characters.';
			case 'text.deckNameMaxLengthError': return ({required Object length}) => 'Deck name must be ${length} characters or less.';
			case 'text.deckListAsyncError': return 'An error occurred while getting the deck list.';
			case 'text.cardEdit': return 'CardEdit';
			case 'text.register': return 'Register';
			case 'text.name': return 'Name';
			case 'text.counter': return 'Counter';
			case 'text.monster': return 'Monster';
			case 'text.ritualMonster': return 'RitualMonster';
			case 'text.fusionMonster': return 'FusionMonster';
			case 'text.synchroMonster': return 'SynchroMonster';
			case 'text.xyzMonster': return 'XyzMonster';
			case 'text.pendulumMonster': return 'PendulumMonster';
			case 'text.linkMonster': return 'LinkMonster';
			case 'text.spell': return 'Spell';
			case 'text.trap': return 'Trap';
			case 'text.cardType': return 'CardType';
			case 'text.illustration': return 'Illustration';
			case 'text.cropIluustration': return 'CropIllustration';
			case 'text.cameraDescription': return 'Please take a picture of the illustration within the frame.';
			case 'text.camera': return 'Camera';
			case 'text.illustrationSetting': return 'IllustrationSetting';
			case 'text.illustrationConfirm': return 'register this image?';
			case 'text.yes': return 'Yes';
			case 'text.cancel': return 'Cancel';
			case 'text.turn': return 'Turn';
			case 'text.duel': return 'duel';
			case 'text.numberOfTimes': return 'NumberOfTimes';
			case 'text.effectDescription': return 'EffectDescription';
			case 'text.initialValue': return 'InitialValue';
			case 'text.button': return 'Button';
			case 'text.save': return 'Save';
			case 'text.imageSaveError': return 'Failed to save the image.';
			case 'text.cardSaveError': return 'Failed to save the card.';
			case 'text.sortCardType': return 'Sort by card type';
			case 'text.manualSort': return 'Manual sorting';
			case 'text.registerDeckNameDialogTitle': return 'Register Deckname';
			case 'text.changeDeckNameDialogTitle': return 'Change Deckname';
			case 'text.changeDeckName': return 'Change Deckname';
			case 'text.deleteDeck': return 'Delete Deck';
			case 'text.deleteDeckConfirm': return 'Do you want to remove this Deck?';
			case 'text.buttonsLengthVaridateError': return 'Register one or more buttons or counters.';
			case 'text.closeDeckScreenConfirm': return 'Do you want to end the duel?';
			case 'text.selectFromCamera': return 'Select from camera';
			case 'text.selectFromGallery': return 'Select from gallery';
			case 'text.addButton': return 'Add button';
			case 'text.addCounter': return 'Add counter';
			case 'text.deckSlot5': return 'Deck Slot +5';
			case 'text.removeAds': return 'Remove Ads';
			case 'text.deckSlot3': return 'Deck Slot +3';
			case 'text.faildGetPurchaseItem': return 'Failed to get purchase item.';
			case 'text.faildPurchase': return 'Failed to purchase.';
			case 'text.upgrade': return 'Upgrade';
			case 'text.thankYou': return 'Thank you!';
			case 'text.deckSlot5PurchaseSuccess': return 'Deck Slot +5 purchase completed.';
			case 'text.removeAdsPurchaseSuccess': return 'Remove Ads purchase completed.';
			case 'text.canceledPurchase': return 'The purchase was canceled.';
			case 'text.restore': return 'Restore purchases infomation.';
			case 'text.restoreSuccess': return 'Restore purchases infomation completed.';
			case 'text.restoreFailed': return 'Failed to restore purchases infomation.';
			case 'text.withDeckSlot3': return 'With Deck Slot +3';
			case 'text.existPurchase': return 'Already purchased.';
			case 'text.confirm': return 'Confirm';
			case 'text.multipleAdsPurchase': return 'Multiple ad-free purchases were identified.\nDeck slots for the amount purchased converted to +10.';
			case 'text.currentDeckSlot': return 'Current deck slot';
			default: return null;
		}
	}
}
