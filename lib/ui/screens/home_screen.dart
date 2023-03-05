import 'package:flutter/material.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/constants/dimens.dart';
import 'package:ipotato/constants/strings.dart';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/ui/common_widgets/add_task_dialog_widget.dart';
import 'package:ipotato/ui/common_widgets/timer_task_card_widget.dart';
import 'package:ipotato/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Duration duration = Duration(minutes: 1);
    // Timer stopwatch = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (duration.inSeconds == 0) {
    //     print("Timer Stopped");
    //   } else {
    //     duration -= Duration(seconds: 1);
    //     final value = duration.toString().split(':');
    //     log("${value[1]}:${value[2].split('.').first}");
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.colorAccentGreen,
        bottom: AppBar(
          backgroundColor: ColorPalette.colorAccentGreen,
          title: const Text(
            Strings.potatoTimerText,
            style: AppTextStyles.textStyleRegularHeadingWhite,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.colorFabSkyBlue,
        child: const Icon(
          Icons.add_circle_outline_sharp,
          color: ColorPalette.colorBlack,
          size: 40,
        ),
        onPressed: () => Utils.showSimpleDialogBox(
          context: context,
          title: "Add task",
          body: AddTaskDialogWidget(context: context),
        ),
      ),
      body: ListView(
        padding: Dimens.regularPagePadding,
        shrinkWrap: true,
        children: [
          TimerTaskCardWidget(
            taskModel: TaskModel(
              title: "New task",
              description:
                  "fhdajhd hvasda sahvs hgxc sagcfagc hx   safdsd saydsagfd",
              timerValue: "22:43:43",
              isCompleted: true,
              isPaused: true,
              isResumed: true,
              isStopped: true,
              isStarted: true,
            ),
          ),
          TimerTaskCardWidget(
            taskModel: TaskModel(
              title: "New task",
              description:
                  "fhdajhd hvasda sahvs hgxc sagcfagc hx   safdsd saydsagfd",
              timerValue: "22:43:43",
              isCompleted: false,
              isPaused: false,
              isResumed: false,
              isStopped: false,
              isStarted: false,
            ),
          ),
          TimerTaskCardWidget(
            taskModel: TaskModel(
              title: "New task",
              description:
                  "fhdajhd hvasda sahvs hgxc sagcfagc hx   safdsd saydsagfd",
              timerValue: "22:43:43",
              isCompleted: false,
              isPaused: true,
              isResumed: false,
              isStopped: false,
              isStarted: false,
            ),
          ),
        ],
      ),
    );
  }
}
