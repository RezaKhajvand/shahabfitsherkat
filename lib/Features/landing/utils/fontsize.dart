double getFontSize(double screenWidth) {
  var mobilePadding = 16;
  var tabletPadding = 18;
  var desktopPadding = 20;

  if (screenWidth < 600) {
    return mobilePadding.toDouble();
  } else if (screenWidth >= 600 && screenWidth < 1100) {
    return tabletPadding.toDouble();
  } else {
    return desktopPadding.toDouble();
  }
}
