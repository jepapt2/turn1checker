import 'package:flutter/material.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/types/local_data_options/local_data_options.dart';

part 'rate_my_app.g.dart';

@riverpod
class RateMyAppNotifier extends _$RateMyAppNotifier {
  @override
  RateMyApp build() {
    init();
    return state;
  }

  void init() {
    final RateMyApp rateMyApp = RateMyApp(
      preferencesPrefix: 'rateMyApp_',
      minDays: 3,
      minLaunches: 3,
      remindDays: 5,
      remindLaunches: 10,
      googlePlayIdentifier: 'com.dairi.turn1checker',
      appStoreIdentifier: '6502574948',
    );

    rateMyApp.init();

    state = rateMyApp;
  }

  Future<void> openRateDialog(BuildContext context) async {
    if (state.shouldOpenDialog) {
      state.showRateDialog(
        context,
        title: t.text.reviewDialogTitle,
        message: t.text.reviewDialogContent,
        rateButton: t.text.rate,
        noButton: t.text.noThanks,
        laterButton: t.text.mabyLater,
      );
    }
  }
}
