import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/widgets/header.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';

@RoutePage()
class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: null);

  static const String path = '/ChangePasswordScreen';

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Header(
              onBack: () {
                context.router.back();
              },
              titleKey: LocaleKeys.settingAccountChangePassword,
            )
          ],
        ),
      ),
    );
  }
}
