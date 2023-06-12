// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "test": "اختبار",
  "day": {
    "zero": "{} يوم",
    "one": "{} يوم",
    "two": "{} أيام",
    "few": "{} أيام",
    "many": "{} يوم",
    "other": "{} يوم"
  }
};
static const Map<String,dynamic> vi = {
  "test": "test",
  "day": {
    "zero": "{} days",
    "one": "{} day",
    "two": "{} days",
    "few": "{} few days",
    "many": "{} many days",
    "other": "{} other days"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "vi": vi};
}