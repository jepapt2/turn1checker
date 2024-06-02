import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/components/ui/dialogs/confirm_dialog.dart';
import 'package:turn1checker/components/ui/primary_snackbar.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/viewmodel/local_data/local_data.dart';

part 'purchase.g.dart';

@riverpod
class PurchaseNotifier extends _$PurchaseNotifier {
  late Offerings offerings;
  late LocalDataNotifier localDataNotifier;
  late CustomerInfo customerInfo;
  @override
  AsyncValue<Offerings> build(BuildContext context) {
    initInAppPurchase();
    localDataNotifier = ref.watch(localDataNotifierProvider.notifier);
    return state;
  }

  Future<void> initInAppPurchase() async {
    state = const AsyncValue.loading();
    try {
      late PurchasesConfiguration configuration;

      if (Platform.isAndroid) {
        configuration =
            PurchasesConfiguration(dotenv.get('REVENUECAT_API_KEY_ANDROID'));
      } else if (Platform.isIOS) {
        configuration =
            PurchasesConfiguration(dotenv.get('REVENUECAT_API_KEY_IOS'));
      }
      await Purchases.configure(configuration);
      //offeringsを取ってくる
      offerings = await Purchases.getOfferings();
      customerInfo = await Purchases.getCustomerInfo();
    } catch (e) {
      if (!context.mounted) return;
      showPrimarySnackbar(
          context, t.text.faildGetPurchaseItem, SnackBarType.error);
    }
    state = AsyncValue.data(offerings);
  }

  bool existRemoveAds() {
    return customerInfo.nonSubscriptionTransactions
        .any((element) => element.productIdentifier == 'remove_ads');
  }

  Future<void> _purchase({
    Package? package,
    required void Function(CustomerInfo info) onSuccess,
  }) async {
    try {
      if (package != null) {
        CustomerInfo updatedCustomerInfo =
            await Purchases.purchasePackage(package);
        customerInfo = updatedCustomerInfo;
        await localDataNotifier.savePurchaseData(customerInfo);
        if (!context.mounted) return;
        onSuccess(updatedCustomerInfo);
      }
    } catch (e) {
      if (!context.mounted) return;
      if (e is PlatformException) {
        if (e.code == "1") {
          showPrimarySnackbar(
              context, t.text.canceledPurchase, SnackBarType.notice);
          return;
        }
        showPrimarySnackbar(context, t.text.faildPurchase, SnackBarType.error);
      }
    }
  }

  Future<void> purchaseRemoveAds() async {
    await _purchase(
        package: offerings.all['default']?.lifetime,
        onSuccess: (info) {
          showPrimarySnackbar(
              context,
              '${t.text.thankYou}\n${t.text.removeAdsPurchaseSuccess}',
              SnackBarType.success);
          final noAdsList = info.nonSubscriptionTransactions
              .where((element) => element.productIdentifier == 'remove_ads');
          if (noAdsList.length > 1) {
            showConfirmDialog(
              context: context,
              description: t.text.multipleAdsPurchase,
              onlyYesButton: true,
              yesButtonText: t.text.confirm,
              descriptionTextStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            );
          }
        });
  }

  Future<void> purchaseDeckSlot5() async {
    await _purchase(
      package: offerings.all['default']?.getPackage('deckSlot5'),
      onSuccess: (_) => showPrimarySnackbar(
          context,
          '${t.text.thankYou}\n${t.text.deckSlot5PurchaseSuccess}',
          SnackBarType.success),
    );
  }

  Future<void> restore() async {
    try {
      CustomerInfo updatedCustomerInfo = await Purchases.restorePurchases();
      customerInfo = updatedCustomerInfo;
      await localDataNotifier.savePurchaseData(customerInfo);
      if (!context.mounted) return;
      showPrimarySnackbar(context, t.text.restoreSuccess, SnackBarType.success);
    } catch (e) {
      if (!context.mounted) return;
      showPrimarySnackbar(context, t.text.restoreFailed, SnackBarType.error);
    }
  }
}
