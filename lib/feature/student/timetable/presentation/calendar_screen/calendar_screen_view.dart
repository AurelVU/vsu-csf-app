import 'package:auto_route/auto_route.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/capitalize_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:table_calendar/table_calendar.dart';

typedef OnDaySelected = void Function(DateTime selectedDay, DateTime focusedDay);

class CalendarScreenView extends StatefulWidget {
  const CalendarScreenView({
    super.key,
    required this.currDatetime,
  });

  final DateTime currDatetime;

  @override
  State<CalendarScreenView> createState() => _CalendarScreenViewState();
}

class _CalendarScreenViewState extends State<CalendarScreenView> {
  final BehaviorSubject<DateTime> selectedDate = BehaviorSubject();

  @override
  void initState() {
    super.initState();
    selectedDate.add(widget.currDatetime);
  }

  @override
  void dispose() {
    selectedDate.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16),
              child: IconButton(
                onPressed: () {
                  context.router.pop();
                },
                icon: SizedBox(
                  width: 28,
                  height: 28,
                  child: Image.asset(
                    'assets/image/close.png',
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: StreamBuilder<DateTime>(
                        stream: selectedDate,
                        builder: (context, snapshot) {
                          DateTime month = DateTime(
                            DateTime.now().year,
                            DateTime.now().month + index,
                          );
                          return TableCalendar(
                            locale: 'ru_RU',
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            availableGestures: AvailableGestures.none,
                            calendarStyle: CalendarStyle(
                                isTodayHighlighted: false,
                                selectedDecoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorScheme.primary,
                                ),
                                selectedTextStyle: AppTypography.normal14.copyWith(
                                  color: AppColor.white,
                                ),
                                defaultTextStyle: AppTypography.normal14),
                            daysOfWeekHeight: 24 * MediaQuery.textScaleFactorOf(context),
                            daysOfWeekStyle: DaysOfWeekStyle(
                              weekdayStyle: AppTypography.normal20.copyWith(
                                color: AppColor.gray,
                              ),
                              weekendStyle: AppTypography.normal20.copyWith(
                                color: AppColor.gray,
                              ),
                            ),
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                              leftChevronVisible: false,
                              rightChevronVisible: false,
                              titleTextFormatter: (date, locale) =>
                                  DateFormat.yMMMM('ru').format(date).capitalize().replaceAll('г.', ''),
                              headerPadding: const EdgeInsets.only(left: 8, bottom: 16),
                            ),
                            focusedDay: month,
                            firstDay: DateTime.now().subtract(const Duration(days: 31)),
                            lastDay: DateTime.now().add(const Duration(days: 365)),
                            onDaySelected: (selectedDay, focusedDay) {
                              selectedDate.value = selectedDay;
                            },
                            selectedDayPredicate: (day) {
                              return isSameDay(selectedDate.value, day);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          context.router.pop(selectedDate.valueOrNull);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.secondary,
                        ),
                        child: Center(
                          child: Text(
                            'Выбрать',
                            style: AppTypography.medium16.copyWith(
                              height: 1.32,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
