getCrossCount(double screenWidth) {
  var mobilePadding = 1;
  var tabletPadding = 2;
  var desktopPadding = 3;

  if (screenWidth < 600) {
    return mobilePadding;
  } else if (screenWidth >= 600 && screenWidth < 1100) {
    return tabletPadding;
  } else if (screenWidth >= 1100) {
    return desktopPadding;
  }
}
