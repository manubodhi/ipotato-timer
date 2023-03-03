import 'package:flutter/material.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/constants/dimens.dart';

class AddTaskDialogWidget extends StatelessWidget {
  const AddTaskDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: () {},
      child: Column(
        children: [
          buildTitleFormField(),
          const SizedBox(
            height: 20,
          ),
          buildDescriptionField(),
          const SizedBox(
            height: 20,
          ),
          buildDurationRow()
        ],
      ),
    );
  }

  Row buildDurationRow() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Duration",
              style: AppTextStyles.textStyleTimerHandText,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TimerHandBox(
                  timeValue: "00",
                  handTypeText: "HH",
                ),
                TimerHandBox(
                  timeValue: "00",
                  handTypeText: "MM",
                ),
                Text(":"),
                TimerHandBox(
                  timeValue: "00",
                  handTypeText: "SS",
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  TaskInputFormField buildDescriptionField() {
    return const TaskInputFormField(
      labelText: "Description",
      minLines: 5,
      maxLines: 10,
    );
  }

  TaskInputFormField buildTitleFormField() {
    return const TaskInputFormField(
      labelText: "Title",
    );
  }
}

class TimerHandBox extends StatelessWidget {
  const TimerHandBox({
    super.key,
    required this.timeValue,
    required this.handTypeText,
  });

  final String timeValue;
  final String handTypeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: Dimens.timerBoxPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: ColorPalette.colorTimerBoxGreen,
          ),
          child: Center(
            child: Text(
              timeValue,
              style: AppTextStyles.textStyleTimerGreenText,
            ),
          ),
        ),
        Text(
          handTypeText,
          style: AppTextStyles.textStyleTimerHandText,
        ),
      ],
    );
  }
}

class TaskInputFormField extends StatelessWidget {
  const TaskInputFormField({
    super.key,
    required this.labelText,
    this.minLines = 1,
    this.maxLines = 10,
  });

  final String labelText;
  final int minLines;
  final int maxLines;

  final OutlineInputBorder taskInputBorder = const OutlineInputBorder(
    //Outline border type for TextFeild
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(
      color: ColorPalette.colorInactiveGrey,
      width: 1,
    ),
  );

  final OutlineInputBorder taskFocusBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(
      color: ColorPalette.colorTimerTextGreen,
      width: 2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle: AppTextStyles.textStyleFloatingLabelText,
        labelStyle: AppTextStyles.textStyleCardBodyGreenText,
        border: taskInputBorder,
        enabledBorder: taskInputBorder,
        focusedBorder: taskFocusBorder,
      ),
    );
  }
}
