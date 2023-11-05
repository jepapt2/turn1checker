import 'package:flutter/material.dart';

double cardAspectRatio({required double mediaWidth, int crossAxisCount = 2}) {
  const horizonPadding = 16;
  final horizonTotalPadding = horizonPadding * crossAxisCount;
  const cardNameHeight = 16;

  final double cardWidth = (mediaWidth - horizonTotalPadding) / crossAxisCount;
  return cardWidth / (cardWidth + cardNameHeight);
}
