import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class GenderForm extends ConsumerStatefulWidget {
  const GenderForm({
    super.key,
  });

  @override
  ConsumerState<GenderForm> createState() => _GenderFormState();
}

class _GenderFormState extends ConsumerState<GenderForm> {
  String genderValue = LocaleKeys.profileGenderMale;

  @override
  void initState() {
    UserEntity? userData = ref.read(authControllerProvider);

    if (userData?.gender != null) {
      genderValue = userData!.gender!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool editProfileState = ref.watch(profileControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            Utils.getLocaleMessage(LocaleKeys.profileGenderTitle),
            style: AppTextStyle.darkPurpleBoldS14,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _box(
              title: Utils.getLocaleMessage(LocaleKeys.profileGenderMale),
              checked: genderValue ==
                  Utils.getLocaleMessage(LocaleKeys.profileGenderMale),
              editProfileState: editProfileState,
            ),
            _box(
              title: Utils.getLocaleMessage(LocaleKeys.profileGenderFemale),
              checked: genderValue ==
                  Utils.getLocaleMessage(LocaleKeys.profileGenderFemale),
              editProfileState: editProfileState,
            ),
          ],
        )
      ],
    );
  }

  ElevatedButton _box({
    required String title,
    required bool checked,
    required bool editProfileState,
  }) {
    return ElevatedButton(
      onPressed: () {
        editProfileState
            ? null
            : setState(() {
                ref.read(profileControllerProvider.notifier).setGender(title);

                genderValue = title;
              });
      },
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(160, 50),
        minimumSize: const Size(160, 50),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: AppColors.shadowColor,
        elevation: 10,
      ),
      child: SizedBox(
        width: 160,
        child: Row(
          children: [
            _iconCheck(checked),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyle.textlavenderGraS12,
            ),
          ],
        ),
      ),
    );
  }

  Container _iconCheck(bool checked) {
    return Container(
      width: 20,
      height: 20,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border:
            Border.all(color: checked ? AppColors.iconColor2 : Colors.black),
      ),
      child: checked
          ? Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: AppColors.iconColor2,
              ),
            )
          : const SizedBox(),
    );
  }
}
