import 'package:flutter/material.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/constants/dimens.dart';
import 'package:ipotato/constants/images.dart';
import 'package:ipotato/constants/strings.dart';
import 'package:ipotato/utils/utils.dart';

class TimerTaskCardWidget extends StatelessWidget {
  const TimerTaskCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorPalette.colorCardBlue,
      margin: Dimens.cardHorizontalMargin,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.cardCornerRadius),
      ),
      child: Column(
        children: [
          Padding(
            padding: Dimens.cardPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      Images.icSoundWave,
                      height: Dimens.icDefaultHeight,
                      width: Dimens.icDefaultHeight,
                    ),
                    Text(
                      "FINISHED",
                      style: AppTextStyles.textStyleCardTimerGreenText,
                    ),
                    Image.asset(
                      Images.icSoundWave,
                      height: Dimens.icDefaultHeight,
                      width: Dimens.icDefaultHeight,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 7,
                      child: Text(
                        "00:02:32",
                        style: AppTextStyles.textStyleCardTimerGreenText,
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: Image.asset(
                        Images.icPlayBtn,
                        height: Dimens.icDefaultHeight,
                        width: Dimens.icDefaultHeight,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Image.asset(
                        Images.icPauseBtn,
                        height: Dimens.icDefaultHeight,
                        width: Dimens.icDefaultHeight,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Image.asset(
                        Images.icStopBtn,
                        height: Dimens.icDefaultHeight,
                        width: Dimens.icDefaultHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Rice cooker",
                  style: AppTextStyles.textStyleCardTitleGreenText,
                ),
                Text(
                  "This is a very long text to see whethere it will fit here or not and then lorem ipsum black fox jumps very big fat bus running through the city",
                  style: AppTextStyles.textStyleCardBodyGreenText,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              padding: Dimens.regularPagePadding,
              height: Dimens.regularButtonHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.cardCornerRadius),
                  color: ColorPalette.colorMarkCompleteButtonPurple),
              child: Center(child: Text(Strings.markCompleteText)),
            ),
          ),
        ],
      ),
    );
  }
}
