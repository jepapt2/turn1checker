import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_data_options.freezed.dart';

@freezed
abstract class LocalDataOptions with _$LocalDataOptions  {
  const factory LocalDataOptions (
          {required int deckSlot,
            required bool noAds,
        }) =
      _LocalDataOptions;
}
