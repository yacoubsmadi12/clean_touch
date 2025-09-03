import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CleanTouchTheme {
  // Primary Colors
  static const Color primaryTurquoise = Color(0xFF00BFA6);
  static const Color primaryOrange = Color(0xFFFF9800);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  
  // Secondary Colors
  static const Color lightTurquoise = Color(0xFF4DD0E1);
  static const Color darkTurquoise = Color(0xFF00695C);
  static const Color lightOrange = Color(0xFFFFB74D);
  static const Color darkOrange = Color(0xFFE65100);
  
  // Neutral Colors
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFFFFFFF);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryTurquoise, lightTurquoise],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient orangeGradient = LinearGradient(
    colors: [primaryOrange, lightOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Shadows
  static const BoxShadow cardShadow = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 8,
    offset: Offset(0, 2),
  );
  
  static const BoxShadow buttonShadow = BoxShadow(
    color: Color(0x26000000),
    blurRadius: 4,
    offset: Offset(0, 2),
  );
  
  // Border Radius
  static const BorderRadius smallRadius = BorderRadius.all(Radius.circular(8));
  static const BorderRadius mediumRadius = BorderRadius.all(Radius.circular(12));
  static const BorderRadius largeRadius = BorderRadius.all(Radius.circular(16));
  static const BorderRadius extraLargeRadius = BorderRadius.all(Radius.circular(24));
  
  // Text Styles
  static TextStyle get headingLarge => GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );
  
  static TextStyle get headingMedium => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );
  
  static TextStyle get headingSmall => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );
  
  static TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textPrimary,
  );
  
  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textSecondary,
  );
  
  static TextStyle get bodySmall => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: textSecondary,
  );
  
  static TextStyle get buttonText => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textLight,
  );
  
  // Button Styles
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryTurquoise,
    foregroundColor: textLight,
    elevation: 2,
    shadowColor: primaryTurquoise.withOpacity(0.3),
    shape: RoundedRectangleBorder(borderRadius: mediumRadius),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  );
  
  static ButtonStyle get secondaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryOrange,
    foregroundColor: textLight,
    elevation: 2,
    shadowColor: primaryOrange.withOpacity(0.3),
    shape: RoundedRectangleBorder(borderRadius: mediumRadius),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  );
  
  static ButtonStyle get outlineButtonStyle => OutlinedButton.styleFrom(
    foregroundColor: primaryTurquoise,
    side: const BorderSide(color: primaryTurquoise, width: 2),
    shape: RoundedRectangleBorder(borderRadius: mediumRadius),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  );
  
  // Input Decoration
  static InputDecoration getInputDecoration({
    required String hintText,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) => InputDecoration(
    hintText: hintText,
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: surfaceLight,
    border: OutlineInputBorder(
      borderRadius: mediumRadius,
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: mediumRadius,
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: mediumRadius,
      borderSide: const BorderSide(color: primaryTurquoise, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: mediumRadius,
      borderSide: const BorderSide(color: error, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );
  
  // Card Decoration
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: surfaceLight,
    borderRadius: mediumRadius,
    boxShadow: const [cardShadow],
  );
  
  // Service Provider Card Decoration
  static BoxDecoration get serviceProviderCardDecoration => BoxDecoration(
    color: surfaceLight,
    borderRadius: largeRadius,
    boxShadow: const [cardShadow],
    border: Border.all(color: const Color(0xFFF0F0F0)),
  );
  
  // App Bar Theme
  static AppBarTheme get appBarTheme => AppBarTheme(
    backgroundColor: primaryWhite,
    foregroundColor: textPrimary,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: headingMedium,
    iconTheme: const IconThemeData(color: textPrimary),
  );
  
  // Bottom Navigation Bar Theme
  static BottomNavigationBarThemeData get bottomNavTheme => BottomNavigationBarThemeData(
    backgroundColor: primaryWhite,
    selectedItemColor: primaryTurquoise,
    unselectedItemColor: textSecondary,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
    selectedLabelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
    unselectedLabelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal),
  );
  
  // Floating Action Button Theme
  static FloatingActionButtonThemeData get fabTheme => FloatingActionButtonThemeData(
    backgroundColor: primaryOrange,
    foregroundColor: textLight,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: extraLargeRadius),
  );
}

