import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/system/application/language_controller.dart';
import 'package:jobs_pot/system/application/theme_controller.dart';
import 'package:jobs_pot/system/domain/infrastructure/system_respository.dart';
import 'application/api_controller.dart';

final apiControllerProvider =
    StateNotifierProvider<ApiController, dynamic>(((ref) {
  return ApiController(ref);
}));

final languageControllerProvider =
    StateNotifierProvider<LanguageController, bool>(
  ((ref) => LanguageController()),
);
final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeMode>(
  ((ref) => ThemeController(ref)),
);

final systemRepositoryProvider = Provider<SytemRepository>(
  (ref) => SytemRepository(),
);
