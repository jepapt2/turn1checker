import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'i18n/i18n.g.dart';
import 'router/router.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  MobileAds.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  runApp(TranslationProvider(child: const ProviderScope(child: App())));
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'turn1Checker',
      locale: LocaleSettings.currentLocale.flutterLocale, // use provider
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: themedata,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
