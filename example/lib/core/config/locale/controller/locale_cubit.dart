import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../get_cashed_locale.dart';
import '../localization_constants.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LanguageCacheHelper languageCacheHelper;

  LocaleCubit({required this.languageCacheHelper})
      : super(ChangeLocaleState(Locale(LocalizationConstants.favoriteLang.languageCode)));

  void getSavedLanguage() async {
    final String cachedLanguageCode = languageCacheHelper.getCachedLanguageCode();
    emit(ChangeLocaleState(Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(BuildContext context, String languageCode) async {
    await languageCacheHelper.cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(Locale(languageCode)));
  }
}
