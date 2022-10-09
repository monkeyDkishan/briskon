part of utils;

extension SizerExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => SizerUtil.width == 0 ? toDouble() : this * SizerUtil.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => SizerUtil.width == 0 ? toDouble() : this * SizerUtil.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => SizerUtil.width == 0 ? toDouble() : double.parse((this * (SizerUtil.width / 4.28) / 100).toStringAsFixed(2));
}
