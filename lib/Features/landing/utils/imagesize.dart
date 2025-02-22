getImageSize(double screenWidth) {
  var mobilePadding = screenWidth / 1.2;
  var tabletPadding = screenWidth / 2;
  var desktopPadding = screenWidth / 2.7;

  if (screenWidth < 600) {
    return mobilePadding;
  } else if (screenWidth >= 600 && screenWidth < 800) {
    return screenWidth / 1.5;
  } else if (screenWidth >= 800 && screenWidth < 1100) {
    return tabletPadding;
  } else if (screenWidth >= 1100) {
    return desktopPadding;
  }
}
