import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/constants/dimens.dart';
import 'package:ipotato/constants/strings.dart';
import 'package:ipotato/constants/validations.dart';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/ui/common_widgets/regular_horizontal_margin.dart';
import 'package:ipotato/utils/utils.dart';

class AddTaskDialogWidget extends StatefulWidget {
  final BuildContext context;
  final Function({TaskModel? taskModel})? callback;
  const AddTaskDialogWidget({
    super.key,
    required this.context,
    this.callback,
  });

  @override
  State<AddTaskDialogWidget> createState() => _AddTaskDialogWidgetState();
}

class _AddTaskDialogWidgetState extends State<AddTaskDialogWidget> {
  final Duration _zeroDuration =
      const Duration(hours: 0, minutes: 0, seconds: 0);
  late Duration _selectedDuration;
  String _time = "";

  late BuildContext _context;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late Function({TaskModel? taskModel})? _callback;

  late bool _isDurationNotSelected;

  @override
  void initState() {
    super.initState();
    _context = widget.context;
    _callback = widget.callback;
    _selectedDuration = _zeroDuration;
    _isDurationNotSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: Utils.getScreenWidth(context) * 0.9,
        child: Column(
          children: [
            Padding(
              padding: Dimens.dialogPadding,
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
              methodCall: () => validateAndSubmit(context),
            ),
          ],
        ),
      ),
    );
  }

  buildDurationRow() {
    final hour = _selectedDuration.toString().split(":")[0];
    final minute = _selectedDuration.toString().split(":")[1];
    final second = _selectedDuration.toString().split(":")[2].split(".").first;

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
              Text(
                _isDurationNotSelected
                    ? Strings.durationErrorText
                    : Strings.durationText,
                style: _isDurationNotSelected
                    ? AppTextStyles.textStyleTimerHandText(
                        color: ColorPalette.colorRedNegative,
                      )
                    : AppTextStyles.textStyleTimerHandText(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimerHandBox(
                    timeValue: hour,
                    handTypeText: "HH",
                  ),
                  const TimeColonWidget(),
                  TimerHandBox(
                    timeValue: minute,
                    handTypeText: "MM",
                  ),
                  const TimeColonWidget(),
                  TimerHandBox(
                    timeValue: second,
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
    return TaskInputFormField(
      labelText: Strings.descriptionText,
      minLines: 5,
      maxLines: 10,
      controller: _titleController,
      validator: Validations.validateEmpty,
    );
  }

  TaskInputFormField buildTitleFormField() {
    return TaskInputFormField(
      labelText: Strings.titleText,
      controller: _descriptionController,
      validator: Validations.validateEmpty,
    );
  }

  _selectFutureTime() {
    _showTimePicker(
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

  void _showTimePicker({
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

  validateAndSubmit(BuildContext dialogContext) {
    FormState formState = _formKey.currentState!;
    if (formState.validate()) {
      if (_selectedDuration == _zeroDuration) {
        setState(() {
          _isDurationNotSelected = true;
        });
      } else {
        _callback!(
          taskModel: TaskModel(
            title: _titleController.text,
            description: _descriptionController.text,
            timerValue: _selectedDuration.toString(),
            isStarted: true,
            isCompleted: false,
            isResumed: false,
            isPaused: false,
            lastKnownDuration: _selectedDuration.toString(),
          ),
        );
        Navigator.pop(context);
      }
    } else {
      Utils.showSnackBar(
          context: context, message: Strings.validationFailedText);
    }
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
          style: AppTextStyles.textStyleTimerHandText(),
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
    required this.controller,
    this.validator,
  });

  final String labelText;
  final int minLines;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  final OutlineInputBorder taskInputBorder = const OutlineInputBorder(
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
      controller: controller,
      validator: validator,
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
