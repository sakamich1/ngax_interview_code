import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ngax_interview_code/global/routes.dart';

import 'global/app_theme.dart';
import 'global/bindings.dart';
import 'global/dependencies_module.dart';
import 'i18n/translation.dart';
import 'module/home/home_screen.dart';

void main() async {

  //WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    GetMaterialApp(
      builder: (context, child) => Scaffold(
        // Global GestureDetector that will dismiss the keyboard
        body: GestureDetector(
          onTap: () {
            hideKeyboard(context);
          },
          child: child,
        ),
      ),
      theme: appThemeData,
      darkTheme: darkThemeData,
      defaultTransition: Transition.fade,
      getPages: AppRouter.routes,
      initialBinding:  HomeBinding() ,
      home: const HomeScreen(),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      translations: Get.find<TranslationsService>(),
      translationsKeys: Get.find<TranslationsService>().keys,
      locale: TranslationsService.locale,
      fallbackLocale: TranslationsService.fallbackLocale,
      supportedLocales: TranslationsService.supportLocales,
    )
    
  );

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}


