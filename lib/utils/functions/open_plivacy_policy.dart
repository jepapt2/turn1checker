import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void openPlivacyPolicy() {
  final locale = WidgetsBinding.instance.platformDispatcher.locale;
  switch (locale.languageCode) {
    case 'ja':
      launchUrl(Uri.parse(
          'https://season-rook-3db.notion.site/turn1checker-124cc3c577fe4cb4aadc9ba52ca1df4f'));
      break;
    default:
      launchUrl(Uri.parse(
          'https://season-rook-3db.notion.site/turn1checker-Privacy-Policy-40d41e2f554e44a9a603cc2c67cbf9a8'));
  }
}
