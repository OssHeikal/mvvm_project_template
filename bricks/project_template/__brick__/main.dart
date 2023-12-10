import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/bloc_observer/app_bloc_observer.dart';
import 'core/config/locale/localization_constants.dart';
import 'core/config/router/router_config.dart';
import 'core/config/theme/light_theme.dart';
import 'core/utils/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init();
  await Future.delayed(const Duration(seconds: 2));
  runApp(EasyLocalization(
      supportedLocales: LocalizationConstants.supportedLocale,
      path: LocalizationConstants.localeFolderPath,
      startLocale: LocalizationConstants.favoriteLang,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return Builder(builder: (ctx) {
            return MaterialApp.router(
              routerConfig: RouteConfigs.routerConfig,
              locale: ctx.locale,
              builder: BotToastInit(),
              supportedLocales: ctx.supportedLocales,
              localizationsDelegates: ctx.localizationDelegates,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: LightTheme.getTheme(),
            );
          });
        },
      ),
    );
  }
}
