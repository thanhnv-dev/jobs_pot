import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_text_styles.dart';

class TitleAndSubTitle extends StatelessWidget {
  const TitleAndSubTitle({
    super.key,
    required this.title,
    required this.subTitle,
    this.subTitle2,
  });

  final String title;
  final String subTitle;
  final String? subTitle2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "$title\n",
          style: AppTextStyle.darkPurpleBoldS30,
          children: <TextSpan>[
            TextSpan(
              text: '$subTitle\n',
              style: AppTextStyle.textColor1RegularS14,
              children: <TextSpan>[
                TextSpan(
                  text: subTitle2,
                  style: AppTextStyle.darkPurpleBoldS14,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
