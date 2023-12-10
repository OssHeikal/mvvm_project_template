import 'package:flutter/material.dart';

class LocalizationConstants {
  static const String localeFolderPath = 'assets/lang';

  static const Locale favoriteLang = Locale("ar");
  static const List<Locale> supportedLocale = [Locale("ar"), Locale("en")];

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
