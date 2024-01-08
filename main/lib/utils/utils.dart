import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:local_storage/local_storage.dart';
import 'package:models/entities/job_summary/job_summary_entity.dart';

class Utils {
  static String getLocaleMessage(String key) {
    return I18n.getLocaleMessage(key);
  }

  static String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  static String getNumberOfJob(JobSummaryEntity? data) {
    if (data?.count != null) {
      return "${data!.count / 1000}k";
    }
    return '';
  }

  static void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.purpleColor,
      timeInSecForIosWeb: 3,
    );
  }

  static void showToastMessageWithLocaleKeys(String localeKeys) {
    Utils.showToastMessage(Utils.getLocaleMessage(localeKeys));
  }

  static void showToastGeneralError() {
    showToastMessageWithLocaleKeys(LocaleKeys.generalError);
  }

  static void showLoading() {
    EasyLoading.show();
  }

  static void hideLoading() {
    EasyLoading.dismiss();
  }

  static void handlerFirebaseError(String errorCode) {
    switch (errorCode) {
      case FirebaseKeys.userNotFound:
        return Utils.showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError3,
        );
      case FirebaseKeys.wrongPassword:
        return Utils.showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError4,
        );
      case FirebaseKeys.tooManyRequests:
        return Utils.showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError5,
        );
      case FirebaseKeys.emailAlreadyInUse:
        return Utils.showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError,
        );
      case FirebaseKeys.accountExistsWithDifferentCredential:
        return Utils.showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError,
        );
      case FirebaseKeys.invalidLoginCredentials:
        return Utils.showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError4,
        );
      default:
        return Utils.showToastGeneralError();
    }
  }

  static final LocalStorage localStorage = LocalStorage();
}
