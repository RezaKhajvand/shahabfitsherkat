double getPadding(double screenWidth) {
  var mobilePadding = 20;
  var tabletPadding = 40;
  var desktopPadding = 60;

  if (screenWidth < 600) {
    return mobilePadding.toDouble();
  } else if (screenWidth >= 600 && screenWidth < 1100) {
    return tabletPadding.toDouble();
  } else {
    return desktopPadding.toDouble();
  }
}
