import 'package:flutter/widgets.dart';

extension ResponsiveX on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isMobile => width < 768;
  bool get isTablet => width >= 768;
  bool get isDesktop => width >= 1024;

  T responsive<T>({
    required T sm,
    T? md,
    T? lg,
  }) {
    if (isDesktop) {
      return lg ?? md ?? sm;
    } else if (isTablet) {
      return md ?? sm;
    } else {
      return sm;
    }
  }
}
