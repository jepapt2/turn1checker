import 'package:flutter/material.dart';

double getCardWidth({required double mediaWidth, int crossAxisCount = 2}) {
  const horizonPadding = 16;
  final horizonTotalPadding = horizonPadding * crossAxisCount;

  final double cardWidth = (mediaWidth - horizonTotalPadding) / crossAxisCount;
  return cardWidth;
}

double cardAspectRatio({required double mediaWidth, int crossAxisCount = 2}) {
  final cardWidth =
      getCardWidth(mediaWidth: mediaWidth, crossAxisCount: crossAxisCount);
  const cardNameHeight = 20;

  return cardWidth / (cardWidth + cardNameHeight);
}
