import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/constants/dimens.dart';
import 'package:ipotato/constants/strings.dart';
import 'package:ipotato/ui/common_widgets/regular_horizontal_margin.dart';

class AddTaskDialogWidget extends StatefulWidget {
  final BuildContext context;
  const AddTaskDialogWidget({
    super.key,
    required this.context,
  });

  @override
  State<AddTaskDialogWidget> createState() => _AddTaskDialogWidgetState();
}

class _AddTaskDialogWidgetState extends State<AddTaskDialogWidget> {
  Duration _selectedDuration = Duration(hours: 0, minutes: 0, seconds: 0);
  String _time = "";

  late BuildContext _context;

  final Key _formKey = const Key("form");

  @override
  void initState() {
    super.initState();
    _context = widget.context;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: Dimens.regularPagePadding,
            child: Column(
              children: [
                buildTitleFormField(),
                const RegularVerticalMargin(),
                buildDescriptionField(),
                const RegularVerticalMargin(),
                buildDurationRow(),
                const RegularVerticalMargin(),
              ],
            ),
          ),
          DialogBottomButton(
            methodCall: () => print("fdsfsf"),
          ),
        ],
      ),
    );
  }

  buildDurationRow() {
    return InkWell(
      onTap: () => _selectFutureTime(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Duration",
                style: AppTextStyles.textStyleTimerHandText,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimerHandBox(
                    timeValue: _selectedDuration.toString().split(":")[0],
                    handTypeText: "HH",
                  ),
                  const TimeColonWidget(),
                  TimerHandBox(
                    timeValue: _selectedDuration.toString().split(":")[1],
                    handTypeText: "MM",
                  ),
                  const TimeColonWidget(),
                  TimerHandBox(
                    timeValue: _selectedDuration
                        .toString()
                        .split(":")[2]
                        .split(".")
                        .first,
                    handTypeText: "SS",
                  ),
                ],
              )
            ],
          ),
        ],
      ),
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

  _selectFutureTime() {
    _showDialog(
      context: _context,
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hms,
        initialTimerDuration: _selectedDuration,
        // This is called when the user changes the timer's
        // duration.
        onTimerDurationChanged: (Duration newDuration) {
          setState(() => _selectedDuration = newDuration);
        },
      ),
    );
  }

  void _showDialog({
    required Widget child,
    required BuildContext context,
  }) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}

class DialogBottomButton extends StatelessWidget {
  final Function()? methodCall;
  const DialogBottomButton({
    super.key,
    required this.methodCall,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: methodCall,
      child: Container(
        padding: Dimens.regularButtonPadding,
        height: Dimens.regularButtonHeight,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimens.cardCornerRadius),
              bottomRight: Radius.circular(Dimens.cardCornerRadius),
            ),
            color: ColorPalette.colorMarkCompleteButtonPurple),
        child: const Center(
          child: Text(Strings.addTaskText),
        ),
      ),
    );
  }
}

class TimeColonWidget extends StatelessWidget {
  const TimeColonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: Dimens.smallItemPadding,
      child: Center(
        child: Text(
          ":",
          style: AppTextStyles.textStyleTimerGreenText,
        ),
      ),
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
          padding: Dimens.regularButtonPadding,
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
