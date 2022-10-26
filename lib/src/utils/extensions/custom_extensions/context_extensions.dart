//

import 'package:flutter/material.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/iterable_extensions.dart';

/// Helper class for device related operations.
///
extension ContextExtensions on BuildContext {
  ///
  /// Pop the page with Navigator.pop(context)
  ///
  void navPop<T>([T? result]) => Navigator.pop<T>(this, result);

  ///
  /// hides the keyboard if its already open
  ///
  get hideKeyboard => FocusScope.of(this).unfocus();

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// orientation
  ///

  double get horizontal =>
      (MediaQuery.of(this).orientation == Orientation.portrait
          ? MediaQuery.of(this).size.width
          : MediaQuery.of(this).size.height);
  double horizontalScale({double scale = 1}) => scale * horizontal;

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// orientation
  ///
  double verticalScale({double scale = 1}) => scale * vertical;
  double get vertical =>
      (MediaQuery.of(this).orientation == Orientation.landscape
          ? MediaQuery.of(this).size.width
          : MediaQuery.of(this).size.height);

  /// The same of [MediaQuery.of(context).size]
  Size get mediaQuerySize => MediaQuery.of(this).size;

  /// The same of [MediaQuery.of(context).size.height]
  /// Note: updates when you resize your screen (like on a browser or
  /// desktop window)
  double get height => mediaQuerySize.height;

  /// The same of [MediaQuery.of(context).size.width]
  /// Note: updates when you resize your screen (like on a browser or
  /// desktop window)
  double get width => mediaQuerySize.width;

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// width
  ///

  double widthScale({double scale = 1}) => scale * width;

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// height
  ///
  double heightScale({double scale = 1}) => scale * height;

  /// Gives you the power to get a portion of the height.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the height
  ///
  /// [reducedBy] is a percentage value of how much of the height you want
  /// if you for example want 46% of the height, then you reduce it by 56%.
  double heightTransformer({double dividedBy = 1, double reducedBy = 0.0}) =>
      (mediaQuerySize.height - ((mediaQuerySize.height / 100) * reducedBy)) /
      dividedBy;

  /// Gives you the power to get a portion of the width.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the width
  ///
  /// [reducedBy] is a percentage value of how much of the width you want
  /// if you for example want 46% of the width, then you reduce it by 56%.
  double widthTransformer({double dividedBy = 1, double reducedBy = 0.0}) =>
      (mediaQuerySize.width - ((mediaQuerySize.width / 100) * reducedBy)) /
      dividedBy;

  /// Divide the height proportionally by the given value
  double ratio({
    double dividedBy = 1,
    double reducedByW = 0.0,
    double reducedByH = 0.0,
  }) =>
      heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) /
      widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);

  /// similar to [MediaQuery.of(context).padding]
  ThemeData get theme => Theme.of(this);

  /// Check if dark mode theme is enable
  bool get isDarkMode => (theme.brightness == Brightness.dark);

  /// give access to context.iconTheme.color
  Color? get iconColor => theme.iconTheme.color;

  /// similar to [MediaQuery.of(context).padding]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// similar to [MediaQuery.of(context).padding]
  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;

  /// similar to [MediaQuery.of(context).padding]
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// similar to [MediaQuery.of(context).viewPadding]
  EdgeInsets get mediaQueryViewPadding => MediaQuery.of(this).viewPadding;

  /// similar to [MediaQuery.of(context).viewInsets]
  EdgeInsets get mediaQueryViewInsets => MediaQuery.of(this).viewInsets;

  /// similar to [MediaQuery.of(context).orientation]
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// check if device is on landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// similar to [MediaQuery.of(this).devicePixelRatio]
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// similar to [MediaQuery.of(this).textScaleFactor]
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  /// get the shortestSide from screen
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  /// True if width be larger than 800
  bool get showNavbar => (width > 800);

  /// True if the width is less than 600p
  bool get isPhoneOrLess => width <= 600;

  /// True if the width is greater than 600p
  bool get isPhoneOrWider => width >= 600;

  /// True if the shortestSide is greater than 600p
  bool get isPhone => isPhoneOrWider;

  /// True if the width is less than 600p
  bool get isSmallTabletOrLess => width <= 600;

  /// True if the width is greater than 600p
  bool get isSmallTabletOrWider => width >= 600;

  /// True if the shortestSide is greater than 600p
  bool get isSmallTablet => isSmallTabletOrWider;

  /// True if the width is less than 720p
  bool get isLargeTabletOrLess => width <= 720;

  /// True if the width is greater than 720p
  bool get isLargeTabletOrWider => width >= 720;

  /// True if the shortestSide is greater than 720p
  bool get isLargeTablet => isLargeTabletOrWider;

  /// True if the current device is Tablet
  bool get isTablet => isSmallTabletOrWider;

  /// True if the width is less than 1200p
  bool get isDesktopOrLess => width <= 1200;

  /// True if the width is greater than 1200p
  bool get isDesktopOrWider => width >= 1200;

  /// True if the width is greater than 1200p
  bool get isDesktop => isDesktopOrWider;

  /// Returns a specific value according to the screen size
  /// if the device width is greater than or equal to 1200 return
  /// [desktop] value. if the device width is greater than  or equal to 600
  /// and less than 1200 return [tablet] value.
  /// if the device width is less than 300  return [watch] value.
  /// in other cases return [mobile] value.
  T responsiveValue<T>({
    T? watch,
    T? mobile,
    T? tablet,
    T? desktop,
  }) {
    assert(
        watch != null || mobile != null || tablet != null || desktop != null);

    var deviceWidth = mediaQuerySize.width;
    //big screen width can display less sizes
    final strictValues = [
      if (deviceWidth >= 1200) desktop, //desktop is allowed
      if (deviceWidth >= 600) tablet, //tablet is allowed
      if (deviceWidth >= 300) mobile, //mobile is allowed
      watch, //watch is allowed
    ].whereType<T>();
    final looseValues = [
      watch,
      mobile,
      tablet,
      desktop,
    ].whereType<T>();
    return strictValues.firstOrNull ?? looseValues.first;
  }
}
