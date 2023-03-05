import 'package:flutter/material.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/constants/dimens.dart';
import 'package:ipotato/constants/images.dart';
import 'package:ipotato/constants/strings.dart';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/ui/common_widgets/regular_horizontal_margin.dart';

class TimerTaskCardWidget extends StatelessWidget {
  const TimerTaskCardWidget({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

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
                taskModel.isCompleted!
                    ? buildFinishedTextRow()
                    : buildTimerAndButtonsRow(
                        timerValue: taskModel.timerValue!,
                        showPauseButton: taskModel.isStarted!,
                        showPlayButton:
                            !taskModel.isStarted! || taskModel.isPaused!,
                        showStopButton:
                            taskModel.isPaused! || taskModel.isStarted!,
                      ),
                const RegularVerticalMargin(),
                buildTitleRow(title: taskModel.title!),
                buildDescriptionRow(description: taskModel.description!)
              ],
            ),
          ),
          Visibility(
            visible: taskModel.isCompleted!,
            child: buildButtonRow(),
          ),
        ],
      ),
    );
  }

  InkWell buildButtonRow() {
    return InkWell(
      onTap: () => {},
      child: Container(
        padding: Dimens.regularButtonPadding,
        height: Dimens.regularButtonHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.cardCornerRadius),
            color: ColorPalette.colorMarkCompleteButtonPurple),
        child: const Center(
          child: Text(
            Strings.markCompleteText,
          ),
        ),
      ),
    );
  }

  Text buildDescriptionRow({required String description}) {
    return Text(
      description,
      style: AppTextStyles.textStyleCardBodyGreenText,
    );
  }

  Text buildTitleRow({
    required String title,
  }) {
    return Text(
      title,
      style: AppTextStyles.textStyleCardTitleGreenText,
    );
  }

  Row buildTimerAndButtonsRow({
    required String timerValue,
    required bool showPlayButton,
    required bool showPauseButton,
    required bool showStopButton,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          fit: FlexFit.loose,
          flex: 7,
          child: Text(
            timerValue,
            style: AppTextStyles.textStyleCardTimerGreenText,
          ),
        ),
        Visibility(
          visible: showPlayButton,
          child: Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Image.asset(
              Images.icPlayBtn,
              height: Dimens.icDefaultHeight,
              width: Dimens.icDefaultHeight,
            ),
          ),
        ),
        Visibility(
          visible: showPauseButton,
          child: Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Image.asset(
              Images.icPauseBtn,
              height: Dimens.icDefaultHeight,
              width: Dimens.icDefaultHeight,
            ),
          ),
        ),
        Visibility(
          visible: showStopButton,
          child: Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Image.asset(
              Images.icStopBtn,
              height: Dimens.icDefaultHeight,
              width: Dimens.icDefaultHeight,
            ),
          ),
        ),
      ],
    );
  }

  Row buildFinishedTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          Images.icSoundWave,
          height: Dimens.icDefaultHeight,
          width: Dimens.icDefaultHeight,
        ),
        const Text(
          "FINISHED",
          style: AppTextStyles.textStyleCardTimerGreenText,
        ),
        Image.asset(
          Images.icSoundWave,
          height: Dimens.icDefaultHeight,
          width: Dimens.icDefaultHeight,
        ),
      ],
    );
  }
}
