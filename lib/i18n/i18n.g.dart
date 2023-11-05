/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 20 (10 per locale)
///
/// Built on 2023-11-04 at 14:48 UTC

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
	String get registerDeckName => 'デッキ名の登録';
	String get reload => '再読み込み';
	String get deckNameRequiredError => 'デッキ名を入力してください';
	String deckNameMinLengthError({required Object length}) => 'デッキ名は${length}文字以上で入力してください';
	String deckNameMaxLengthError({required Object length}) => 'デッキ名は${length}文字以内で入力してください';
	String get deckListAsyncError => 'デッキリストの取得に失敗しました';
	String get register => '登録';
	String get hello => 'こんちゃ';
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
	@override String get registerDeckName => 'Register Deckname';
	@override String get reload => 'Reload';
	@override String get deckNameRequiredError => 'Please enter a deck name.';
	@override String deckNameMinLengthError({required Object length}) => 'Deck name must be at least ${length} characters.';
	@override String deckNameMaxLengthError({required Object length}) => 'Deck name must be ${length} characters or less.';
	@override String get deckListAsyncError => 'An error occurred while getting the deck list.';
	@override String get register => 'Register';
	@override String get hello => 'Heeey';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _I18nJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'text.deckList': return 'デッキリスト';
			case 'text.deckName': return 'デッキ名';
			case 'text.registerDeckName': return 'デッキ名の登録';
			case 'text.reload': return '再読み込み';
			case 'text.deckNameRequiredError': return 'デッキ名を入力してください';
			case 'text.deckNameMinLengthError': return ({required Object length}) => 'デッキ名は${length}文字以上で入力してください';
			case 'text.deckNameMaxLengthError': return ({required Object length}) => 'デッキ名は${length}文字以内で入力してください';
			case 'text.deckListAsyncError': return 'デッキリストの取得に失敗しました';
			case 'text.register': return '登録';
			case 'text.hello': return 'こんちゃ';
			default: return null;
		}
	}
}

extension on _I18nEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'text.deckList': return 'DeckList';
			case 'text.deckName': return 'DeckName';
			case 'text.registerDeckName': return 'Register Deckname';
			case 'text.reload': return 'Reload';
			case 'text.deckNameRequiredError': return 'Please enter a deck name.';
			case 'text.deckNameMinLengthError': return ({required Object length}) => 'Deck name must be at least ${length} characters.';
			case 'text.deckNameMaxLengthError': return ({required Object length}) => 'Deck name must be ${length} characters or less.';
			case 'text.deckListAsyncError': return 'An error occurred while getting the deck list.';
			case 'text.register': return 'Register';
			case 'text.hello': return 'Heeey';
			default: return null;
		}
	}
}
