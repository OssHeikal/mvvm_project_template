import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fonts_manager.dart';

class TextStylesManager {
  const TextStylesManager._();
  static TextStyle ibmPlexSansArabicRegular = GoogleFonts.ibmPlexSansArabic(
    fontWeight: FontWeightManager.regular,
  );
  static TextStyle ibmPlexSansArabicMedium = GoogleFonts.ibmPlexSansArabic(
    fontWeight: FontWeightManager.medium,
  );
  static TextStyle ibmPlexSansArabicSemiBold = GoogleFonts.ibmPlexSansArabic(
    fontWeight: FontWeightManager.semiBold,
  );
  static TextStyle ibmPlexSansArabicBold = GoogleFonts.ibmPlexSansArabic(
    fontWeight: FontWeightManager.bold,
  );
}

class ShadowStyles {
  const ShadowStyles._();
}

class GradientStyles {
  const GradientStyles._();
}
