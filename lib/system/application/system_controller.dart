import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

import '../domain/entities/app_state_entity.dart';

class SystemController extends StateNotifier<AppStateEntity> {
  final Ref ref;

  SystemController(this.ref) : super(const AppStateEntity(message: ""));

  void showToastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  void showToastGeneralError() {
    Fluttertoast.showToast(
        msg: Utils.getLocaleMessage(LocaleKeys.generalError));
  }

  void handlerFirebaseError(String errorCode) {
    switch (errorCode) {
      case FirebaseKeys.userNotFound:
        return showToastMessage(
          Utils.getLocaleMessage(LocaleKeys.authenticationSignUpError3),
        );
      case FirebaseKeys.wrongPassword:
        return showToastMessage(
          Utils.getLocaleMessage(LocaleKeys.authenticationSignUpError4),
        );
      case FirebaseKeys.tooManyRequests:
        return showToastMessage(
          Utils.getLocaleMessage(LocaleKeys.authenticationSignUpError5),
        );
      case FirebaseKeys.emailAlreadyInUse:
        return showToastMessage(
          Utils.getLocaleMessage(LocaleKeys.authenticationSignUpError),
        );
      default:
        return showToastGeneralError();
    }
  }
}
