import 'package:flutter/material.dart';

class AppPaddings {
  const AppPaddings._();

  static const EdgeInsets zero = EdgeInsets.zero;
  static const EdgeInsets screen = EdgeInsets.all(20);
  static const EdgeInsets screenLarge = EdgeInsets.all(24);
  static const EdgeInsets card = EdgeInsets.all(20);
  static const EdgeInsets content = EdgeInsets.all(16);
  static const EdgeInsets shellContent = EdgeInsets.fromLTRB(20, 18, 20, 0);
  static const EdgeInsets shellNavigation = EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const EdgeInsets inputContent = EdgeInsets.symmetric(
    horizontal: 18,
    vertical: 18,
  );
  static const EdgeInsets segmented = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 12,
  );
  static const EdgeInsets chip = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );
  static const EdgeInsets compactChip = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 6,
  );
  static const EdgeInsets credential = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  );
  static const EdgeInsets tile = EdgeInsets.all(14);
  static const EdgeInsets listBottom = EdgeInsets.only(bottom: 14);
}

class AppGaps {
  const AppGaps._();

  static const SizedBox v4 = SizedBox(height: 4);
  static const SizedBox v6 = SizedBox(height: 6);
  static const SizedBox v8 = SizedBox(height: 8);
  static const SizedBox v12 = SizedBox(height: 12);
  static const SizedBox v14 = SizedBox(height: 14);
  static const SizedBox v16 = SizedBox(height: 16);
  static const SizedBox v18 = SizedBox(height: 18);
  static const SizedBox v20 = SizedBox(height: 20);
  static const SizedBox v24 = SizedBox(height: 24);

  static const SizedBox h8 = SizedBox(width: 8);
  static const SizedBox h10 = SizedBox(width: 10);
  static const SizedBox h12 = SizedBox(width: 12);
  static const SizedBox h14 = SizedBox(width: 14);
}

class AppRadii {
  const AppRadii._();

  static const BorderRadius card = BorderRadius.all(Radius.circular(28));
  static const BorderRadius input = BorderRadius.all(Radius.circular(22));
  static const BorderRadius chip = BorderRadius.all(Radius.circular(18));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(16));
  static const BorderRadius tile = BorderRadius.all(Radius.circular(20));
  static const BorderRadius navigation = BorderRadius.all(Radius.circular(30));
}
