import 'package:flutter/material.dart';

// Define all color that we are using in app
// If you don't know the color name check this out->https://www.color-name.com/hex
// Use proper color name for consistency
class AppColors {
  //Theme Color
  static const Color primaryColor = Color(0xFFFC9D11);
  static const Color secondaryColor = Color(0xff662113);

  static const Color black = Color(0xFF17161B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F5F5);
  static const Color background2 = Color(0xFF999999);
  static const Color popupMenuBackground = Color(0xFFFDF8F0);
  static const Color selectedPopupMenu = Color(0xFFF4D496);

  static const Color gradientColor1 = Color(0x0FFC9D11);
  static const Color gradientColor2 = Color(0xFFA5957E);
  static const Color gradientColor3 = Color(0xAA232220);
  static const Color gradientColor4 = Color(0xAAE1E7F7);

  // Gradients
  static const Gradient gradientOne = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      AppColors.primaryColor,
      AppColors.secondaryColor,
    ],
  );

  static const Gradient gradientTwo = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Colors.white24,
      AppColors.white,
    ],
  );

  static const Gradient gradientThree = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Colors.white24,
      Colors.blueGrey,
    ],
  );
}
