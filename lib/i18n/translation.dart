import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngax_interview_code/i18n/ja_JP.dart';
import 'package:ngax_interview_code/i18n/zh_CN.dart';

class TranslationsService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const Locale fallbackLocale = Locale('ja' /*, 'JP'*/);
  static final List<Locale> supportLocales = [
    const Locale('zh' /*, 'CN'*/),
    const Locale('ja' /*, 'JP'*/)
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'zh': zh_CN,
        'ja': ja_JP,
      };
}
