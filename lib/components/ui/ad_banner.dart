import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/viewmodel/local_data/local_data.dart';

class AdBanner extends HookConsumerWidget {
  const AdBanner({
    super.key,
    this.margin,
  });

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final localData = ref.watch(localDataNotifierProvider);
    final AdManagerBannerAd myBanner = AdManagerBannerAd(
        adUnitId: Platform.isIOS
            ? dotenv.get('ADMOB_BANNER_UNIT_ID_IOS')
            : dotenv.get('ADMOB_BANNER_UNIT_ID_ANDROID'),
        sizes: [AdSize(width: mediaWidth.toInt(), height: 60)],
        request: const AdManagerAdRequest(),
        listener: AdManagerBannerAdListener());

    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    return localData.maybeWhen(
      data: (localConfig) {
        return localConfig.noAds
            ? const SizedBox()
            : Container(
                margin: margin,
                alignment: Alignment.center,
                width: myBanner.sizes[0].width.toDouble(),
                height: myBanner.sizes[0].height.toDouble(),
                child: adWidget,
              );
      },
      orElse: () => const SizedBox(),
    );
  }
}
