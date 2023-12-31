import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/common/widgets/un_focus_keyboard.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/create/create_provider.dart';
import 'package:jobs_pot/features/create/presentation/widgets/create_header.dart';
import 'package:jobs_pot/features/create/presentation/widgets/create_post_input_form.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({
    super.key,
  });

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen>
    with TickerProviderStateMixin {
  late FormGroup _createPostInputForm;

  @override
  void initState() {
    super.initState();

    _createPostInputForm =
        ref.read(createPostController.notifier).getCreatePostInputForm();

    _createPostInputForm.reset();
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity? userData = ref.watch(authControllerProvider);
    final List<XFile>? imagesData = ref.watch(createPostController);
    final List<String>? uploadsData =
        ref.watch(uploadImageToFirebaseController);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: CreateHeader(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: UnFocusKeyboard(
          context: context,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ReactiveForm(
              formGroup: _createPostInputForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imagesData != null && uploadsData != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Utils.getLocaleMessage(
                                  LocaleKeys.postPostingProcessTitle),
                              style: AppTextStyle.text4BoldS16,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        LocaleKeys.postPostingProcessStep1Title
                                            .plural(0, args: [
                                          uploadsData.length.toString(),
                                          (imagesData.length - 1).toString()
                                        ]),
                                        style: AppTextStyle.darkPurpleBoldS12,
                                      ),
                                      Container(
                                        width: 10,
                                        height: 10,
                                        margin: const EdgeInsets.only(left: 10),
                                        child: uploadsData.length ==
                                                (imagesData.length - 1)
                                            ? SvgPicture.asset(AppIcons.checked)
                                            : const CircularProgressIndicator(
                                                color:
                                                    AppColors.fireYellowColor,
                                                strokeWidth: 2,
                                              ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    Utils.getLocaleMessage(LocaleKeys
                                        .postPostingProcessStep2Title),
                                    style: AppTextStyle.darkPurpleBoldS12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  _addPostTitle(),
                  const SizedBox(height: 30),
                  _userInfo(userData),
                  const CraetePostInputForm(),
                  Text(
                    Utils.getLocaleMessage(LocaleKeys.postImagesTitle),
                    style: AppTextStyle.darkPurpleBoldS12,
                  ),
                  const SizedBox(height: 10),
                  imagesData != null && imagesData.isNotEmpty
                      ? _imagesView(context, imagesData)
                      : _addImages(context),
                  const SizedBox(height: 60)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagesView(BuildContext context, List<XFile> imagesData) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: imagesData.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < imagesData.length - 1) {
            return GestureDetector(
              onTap: () async {
                await _previewImages(
                  context: context,
                  imagesData: imagesData,
                  index: index,
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Image.file(
                  File(imagesData[index].path),
                ),
              ),
            );
          } else {
            return _addImages(context);
          }
        },
      ),
    );
  }

  GestureDetector _addImages(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.read(createPostController.notifier).addImages(context);
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        dashPattern: const [8, 6],
        padding: const EdgeInsets.all(50),
        child: SizedBox(
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            AppIcons.add,
          ),
        ),
      ),
    );
  }

  Future<void> _previewImages({
    required BuildContext context,
    required List<XFile> imagesData,
    required int index,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Image.file(
            File(imagesData[index].path),
          ),
          actions: _actionsPreviewImage(
            context: context,
            imagesData: imagesData,
            index: index,
          ),
        );
      },
    );
  }

  List<Widget> _actionsPreviewImage({
    required BuildContext context,
    required List<XFile> imagesData,
    required int index,
  }) {
    return <Widget>[
      TextButton(
        child: Text(
          Utils.getLocaleMessage(LocaleKeys.postImagesCancelButtonTitle),
          style: AppTextStyle.darkPurpleBoldS14,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      TextButton(
        child: Text(
          Utils.getLocaleMessage(
            LocaleKeys.postImagesDeleteButtonTitle,
          ),
          style: AppTextStyle.redBoldS14,
        ),
        onPressed: () {
          imagesData.removeAt(index);

          ref.read(createPostController.notifier).updateImageData(imagesData);

          Navigator.of(context).pop();
        },
      ),
    ];
  }

  Row _userInfo(UserEntity? userData) {
    return Row(
      children: [
        AvatarImage(
          size: 60,
          avatarLink: userData?.avatarLink,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userData?.userName ?? "",
                style: AppTextStyle.darkPurpleBoldS14,
              ),
              const SizedBox(height: 5),
              Text(
                userData?.location ?? "",
                style: AppTextStyle.textBlackColorRegularS12,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _addPostTitle() {
    return Text(
      Utils.getLocaleMessage(LocaleKeys.postAddPostTitle),
      style: AppTextStyle.text4BoldS16,
    );
  }
}
