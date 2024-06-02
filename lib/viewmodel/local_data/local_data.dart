import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turn1checker/types/local_data_options/local_data_options.dart';

part 'local_data.g.dart';

@riverpod
class LocalDataNotifier extends _$LocalDataNotifier {
  late SharedPreferences prefs;
  @override
  AsyncValue<LocalDataOptions> build() {
    getInitialDatas();
    return state;
  }

  Future<void> getInitialDatas() async {
    state = const AsyncValue.loading();
    prefs = await SharedPreferences.getInstance();
    final noAdsCount = prefs.getInt('noAdsCount') ?? 0;
    final deckSlot5Count = prefs.getInt('deckSlot5Count') ?? 0;
    //初期デッキ枠
    int count = 2;
    if (noAdsCount > 0) {
      count = count + 3;
    }
    if (noAdsCount > 1) {
      count = count + (noAdsCount - 1) * 10;
    }
    count = count + deckSlot5Count * 5;
    state = AsyncValue.data(
        LocalDataOptions(deckSlot: count, noAds: noAdsCount > 0));
  }

  Future<void> savePurchaseData(CustomerInfo customerInfo) async {
    final purchaseList = customerInfo.nonSubscriptionTransactions;
    final noAdsCount = purchaseList
        .where((element) => element.productIdentifier == 'remove_ads')
        .toList()
        .length;
    final deckSlot5Count = purchaseList
        .where((element) => element.productIdentifier == 'deck_slot_5')
        .toList()
        .length;
    await prefs.setInt('noAdsCount', noAdsCount);
    await prefs.setInt('deckSlot5Count', deckSlot5Count);
    getInitialDatas();
  }
}
