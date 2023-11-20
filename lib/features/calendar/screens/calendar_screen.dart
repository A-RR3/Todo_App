import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/features/calendar/controllers/calendar_controller.dart';
import 'package:training_task1/features/home/widgets/task_item.dart';
import 'package:training_task1/utils/helpers.dart';

class MyCalendarScreen extends StatelessWidget {
  MyCalendarScreen({super.key});
  final CalendarController controller = Get.put(CalendarController());
  @override
  Widget build(BuildContext context) {
    List<String> days = [
      'SU',
      'MO',
      'TU',
      'WE',
      'TH',
      'FR',
      'SA',
    ];
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Calendar',
          style: textTheme(20, FontWeight.w400, null),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),
      backgroundColor: bgColor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  days.length,
                  (index) => Text(
                        days[index],
                        style: textTheme(12, FontWeight.w500, null),
                      ),
                  growable: false)),
          const Divider(
            height: 40,
            thickness: 2,
          ),
          Expanded(
            child: Stack(
              children: [
                PagedVerticalCalendar(
                  minDate: DateTime.utc(2023, 10, 20),
                  maxDate: DateTime.utc(2024, 11, 20),
                  invisibleMonthsThreshold: 1,
                  startWeekWithSunday: true,
                  onDayPressed: (date) {
                    controller.onDayPressed(date);
                  },
                  dayBuilder: (context, date) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                          child: Obx(() => Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.isDateHasTasks(date).value
                                    ? const Color(calendarGreen)
                                    : (Helpers.formatDateFromDateTime(
                                                controller.selectedDay.value) ==
                                            Helpers.formatDateFromDateTime(date)
                                        ? const Color(calendarOrange)
                                        : null),
                              ),
                              child: Center(
                                  child: Text(
                                '${date.day}',
                                style: textTheme(18, FontWeight.w500, null),
                              ))))),
                    );
                  },
                ),
                Obx(() => Visibility(
                    visible:
                        controller.tasksOnTargetDate.isEmpty ? false : true,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: Get.height * .2,
                        width: Get.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                controller.tasksOnTargetDate.length,
                                (index) => Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              right: 10, left: 10),
                                          width: Get.width * .9,
                                          child: TaskItem(
                                              marginTop: 0,
                                              task: controller
                                                  .tasksOnTargetDate[index]),
                                        ),
                                      ],
                                    )),
                          ),
                        ),
                      ),
                    )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
