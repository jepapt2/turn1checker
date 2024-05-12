import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'i18n/i18n.g.dart';
import 'router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TranslationProvider(child: const ProviderScope(child: App())));
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'turn1Checker',
      locale: TranslationProvider.of(context).flutterLocale, // use provider
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
