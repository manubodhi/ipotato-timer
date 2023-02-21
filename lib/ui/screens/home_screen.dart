import 'package:flutter/material.dart';
import 'package:ipotato/constants/app_text_styles.dart';
import 'package:ipotato/constants/color_palette.dart';
import 'package:ipotato/constants/dimens.dart';
import 'package:ipotato/constants/strings.dart';
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
          body: AddTaskDialogWidget(),
        ),
      ),
      body: ListView(
        padding: Dimens.regularPagePadding,
        shrinkWrap: true,
        children: [
          TimerTaskCardWidget(),
          TimerTaskCardWidget(),
          TimerTaskCardWidget(),
        ],
      ),
    );
  }
}
