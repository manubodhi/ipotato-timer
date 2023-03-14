import 'package:flutter/material.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/constants/dimens.dart';
import 'package:ipotato/constants/strings.dart';
import 'package:ipotato/data/local/models/task_model.dart';
import 'package:ipotato/stores/task_list_store.dart';
import 'package:ipotato/ui/common_widgets/add_task_dialog_widget.dart';
import 'package:ipotato/ui/common_widgets/timer_task_card_widget.dart';
import 'package:ipotato/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<TaskListStore>(context);

    taskList.reinstateStateFromDrift();

    return Provider<TaskListStore>(
      create: (_) => TaskListStore(),
      child: Scaffold(
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
            body: AddTaskDialogWidget(
              context: context,
              callback: ({taskModel}) => taskList.addTask(taskModel!),
            ),
          ),
        ),
        body: buildTaskList(taskList),
      ),
    );
  }

  Observer buildTaskList(TaskListStore taskList) {
    return Observer(
      builder: (_) => ListView.builder(
        padding: Dimens.regularPagePadding,
        shrinkWrap: true,
        itemCount: taskList.visibleTasks.length,
        itemBuilder: (_, index) {
          final task = taskList.visibleTasks[index];
          return Observer(
            builder: (_) => TimerTaskCardWidget(
              onMarkCompletePressed: () {
                taskList.removeTask(task);
              },
              onPauseButtonPressed: () {
                task.pause();
              },
              onPlayButtonPressed: () {
                task.start();
              },
              onStopButtonPressed: () {
                task.stop();
                taskList.removeTask(task);
              },
              taskModel: TaskModel(
                id: task.id,
                title: task.title,
                description: task.description,
                timerValue: task.time,
                lastKnownDuration: task.lastKnownDuration,
                isCompleted: task.isCompleted,
                isPaused: task.isPaused,
                isResumed: task.isRunning,
                isStarted: task.isStarted,
              ),
            ),
          );
        },
      ),
    );
  }
}
