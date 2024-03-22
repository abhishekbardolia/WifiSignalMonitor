import 'dart:ui';

import '../../../util/app_colors.dart';
import '../../../util/wifi_utils.dart';

class Strength{
  Strength({required this.color,required  this.svgPath});
  final Color color;
  final String svgPath;

  static Strength fromSignalLevel(int? level) {
    int colorIndex = calculateSignalLevel(level?.toInt() ?? 0);
    switch (colorIndex) {
      case 0:
        return Strength(color: error, svgPath: "assets/signal_wifi_0_bar.svg");
      case 1:
        return Strength(color: warning, svgPath: "assets/signal_wifi_1_bar.svg");
      case 2:
        return Strength(color: warning, svgPath: "assets/signal_wifi_2_bar.svg");
      case 3:
        return Strength(color: success, svgPath: "assets/signal_wifi_3_bar.svg");
      case 4:
        return Strength(color: success, svgPath: "assets/signal_wifi_4_bar.svg");
      default:
        return Strength(color: success, svgPath: "assets/signal_wifi_3_bar");
    }
  }
}


