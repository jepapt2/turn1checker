import 'package:flutter/material.dart';

double getCardWidth({required BuildContext context, int crossAxisCount = 2}) {
  final double mediaWidth = MediaQuery.of(context).size.width;
  const horizonPadding = 16;
  final horizonTotalPadding = horizonPadding * crossAxisCount;

  final double cardWidth = (mediaWidth - horizonTotalPadding) / crossAxisCount;
  return cardWidth;
}

double cardAspectRatio(
    {required BuildContext context, int crossAxisCount = 2}) {
  final cardWidth =
      getCardWidth(context: context, crossAxisCount: crossAxisCount);
  const cardNameHeight = 19.5;

  return cardWidth / (cardWidth + cardNameHeight);
}
