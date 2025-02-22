getFirstSectionHeight(double screenHeight, double screenWidth) {
  var mobilePadding = screenHeight / 1.2;
  var desktopPadding = screenHeight;

  if (screenWidth < 550) {
    return mobilePadding;
  } else {
    return desktopPadding;
  }
}
