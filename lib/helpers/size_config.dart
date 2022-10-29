import 'package:flutter/material.dart';

extension TextSize on double {
  double toAdaptive(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double w = _mediaQueryData.size.width / 100;
    double sizeTextLayout = this / (414 / 100);
    double sizedText = sizeTextLayout * w;
    return sizedText;
  }
}
